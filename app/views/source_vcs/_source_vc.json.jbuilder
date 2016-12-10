json.extract! source_vc, :id, :repository_id, :branch, :tag, :revision, :created_at, :updated_at
json.url source_vc_url(source_vc, format: :json)
