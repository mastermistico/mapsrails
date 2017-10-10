class PlacesController < ApplicationController
  def index
    @places = Place.order('created_at DESC')
     
  end

  def new
    @place = Place.new
    @places = Place.order('created_at DESC')
        @hash = Gmaps4rails.build_markers(@places) do |place, marker|
            marker.lat place.latitude
            marker.lng place.longitude
      end 
      render 'new'
  end

  def create
    @place = Place.new(place_params)
    @places = Place.order('created_at DESC')
    if @place.save
      flash[:success] = "Lugar agregado!"
      redirect_to root_path
      #render 'new'
    else
      render 'new'
    end
  end

  def show
  @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:title, :address, :visited_by, :latitude, :longitude)
  end
end
