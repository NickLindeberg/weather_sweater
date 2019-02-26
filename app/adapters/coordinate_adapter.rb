class CoordinateAdapter

  def pinpoint(location)
    GoogleCoordsService.new.get_coords(location)
  end

end
