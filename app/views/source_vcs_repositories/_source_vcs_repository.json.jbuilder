json.extract! source_vcs_repository, :id, :server_id, :name, :shortname, :created_at, :updated_at
json.url source_vcs_repository_url(source_vcs_repository, format: :json)