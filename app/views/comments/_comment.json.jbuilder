json.extract! comment, :id, :product_id, :body, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)