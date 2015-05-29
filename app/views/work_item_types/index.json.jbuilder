json.array!(@work_item_types) do |work_item_type|
  json.extract! work_item_type, :id, :description
  json.url work_item_type_url(work_item_type, format: :json)
end
