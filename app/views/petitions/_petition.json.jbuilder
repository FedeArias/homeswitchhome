json.extract! petition, :id, :email, :created_at, :updated_at
json.url petition_url(petition, format: :json)
