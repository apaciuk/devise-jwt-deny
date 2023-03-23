# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

# Member no auth

curl -XGET -H "Content-Type: application/json" http://localhost:3000/member-data # fails no auth

# Sign up

curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users

# Sign in

curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users/sign_in # (grab token for signout, and member login))

# Sign out

curl -XDELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjc5NTQ5ODQyLCJleHAiOjE2ODA3NTk0NDIsImp0aSI6IjM1ZjcxZGMxLTc5ODYtNDE4NC1hMjQwLWRkYmY4OWY1MjUyNyJ9.\_CZcGaoGFtYogOz3v753-\_DxynEex9AVFipmhPFew2E" -H "Content-Type: application/json" http://localhost:3000/users/sign_out # (use Bearer token from login, not this one)

# Member with auth.

curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjc5NTQ5ODQyLCJleHAiOjE2ODA3NTk0NDIsImp0aSI6IjM1ZjcxZGMxLTc5ODYtNDE4NC1hMjQwLWRkYmY4OWY1MjUyNyJ9.\_CZcGaoGFtYogOz3v753-\_DxynEex9AVFipmhPFew2E" -H "Content-Type: application/json" http://localhost:3000/member-data # (use Bearer token from login, not this one)
