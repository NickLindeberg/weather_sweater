class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :location
  # attributes :currently, :daily, :hourly
end
