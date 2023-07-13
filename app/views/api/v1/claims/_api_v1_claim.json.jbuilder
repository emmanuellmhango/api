json.extract! api_v1_claim, :id, :comment, :location, :forwarded, :category, :user_id, :created_at, :updated_at
json.url api_v1_claim_url(api_v1_claim, format: :json)
