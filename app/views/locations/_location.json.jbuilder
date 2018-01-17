json.extract! location, :id, :name, :xcoordinate, :ycoordinate, :created_at, :updated_at
json.url location_url(location, format: :json)
