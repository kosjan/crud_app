json.extract! employee, :id, :first_name, :second_name, :email, :phone, :vk, :created_at, :updated_at
json.url employee_url(employee, format: :json)
