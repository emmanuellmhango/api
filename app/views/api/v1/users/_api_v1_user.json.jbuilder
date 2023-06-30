json.extract! api_v1_user, :id, :name, :email, :password, :phone, :dob, :created_at, :updated_at
json.url api_v1_user_url(api_v1_user, format: :json)
