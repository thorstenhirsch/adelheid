json.extract! user, :id, :firstname, :lastname, :username, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :failed_attempts, :unlock_token, :locked_at, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
