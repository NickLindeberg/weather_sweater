class CoordinateAdapter
  attr_reader :pinpoint
  
  def pinpoint(location)
    GoogleCoordsService.new.get_coords(location)
  end
end
