class GifSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  attributes :images, :copyright
end
