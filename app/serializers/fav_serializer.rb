class FavSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :url
end
