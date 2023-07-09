json.extract! api_v1_user_management, :id, :company_name, :username, :email, :phone, :social_link, :package, :category_id, :created_at, :updated_at
json.url api_v1_user_management_url(api_v1_user_management, format: :json)
