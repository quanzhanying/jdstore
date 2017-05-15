json.extract! favorite_list, :id, :product_id, :user_id, :created_at, :updated_at
json.url favorite_list_url(favorite_list, format: :json)