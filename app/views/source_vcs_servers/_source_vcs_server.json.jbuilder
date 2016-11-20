json.extract! source_vcs_server, :id, :name, :url, :user, :password, :vcs, :created_at, :updated_at
json.url source_vcs_server_url(source_vcs_server, format: :json)