class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
end
