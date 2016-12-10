json.extract! user_application, :id, :user_id, :application_id, :environment_spec, :created_at, :updated_at
json.url user_application_url(user_application, format: :json)
