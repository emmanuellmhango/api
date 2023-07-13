json.extract! api_v1_claim, :id, :comment, :location, :forwarded, :user_id, :category_id, :created_at, :updated_at
json.url api_v1_claim_url(api_v1_claim, format: :json)
