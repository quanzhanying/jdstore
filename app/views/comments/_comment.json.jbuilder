json.extract! comment, :id, :content, :product_id, :user_id, :image, :function, :design, :experience, :created_at, :updated_at
json.url comment_url(comment, format: :json)