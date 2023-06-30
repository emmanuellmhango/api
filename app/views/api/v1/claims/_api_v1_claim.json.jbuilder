json.extract! api_v1_claim, :id, :img_one, :img_two, :comment, :location, :user_id, :client_id, :category_id, :created_at, :updated_at
json.url api_v1_claim_url(api_v1_claim, format: :json)
