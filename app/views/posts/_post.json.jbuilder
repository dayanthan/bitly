json.extract! post, :id, :base_url, :short_url, :count, :created_at, :updated_at
json.url post_url(post, format: :json)
