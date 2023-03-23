class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'You are logged in.' }, status: :ok
  end

  def respond_to_on_destroy
    add_to_denylist && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out." }, status: :ok
  end

  def log_out_failure
    render json: { message: "Hmm nothing happened, it all messed up."}, status: :unauthorized, location: after_sign_out_path_for(resource_name)
  end

  # Other methods tried
  def add_to_denylist
    token = request.headers['Authorization']['Bearer'].to_s
    jti = JWT.decode(token, Rails.application.credentials.devise[:jwt_secret_key].to_s, true, { algorithm: 'HS256' }).first['jti']
    JwtDenylist.create(jti: jti)
 
    render json: { message: "You are sucessfully logged out." }, status: :ok, location: after_sign_out_path_for(resource_name)
  end 

  def decode_and_add_to_list
    token = request.headers['Authorization']['Bearer'].to_s
    secret = Rails.application.credentials.devise[:jwt_secret_key].to_s
    payload = JWT.decode(token, secret, true, { algorithm: 'HS256' }).first
    jti = payload['jti']
    JwtDenylist.create(jti: jti)
  end
end