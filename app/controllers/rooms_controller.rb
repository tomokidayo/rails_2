class RoomsController < ApplicationController
  def index
    @rooms = Room.all # Roomモデルから全てのデータを取得
  end

 
  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
  
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end
  
  private
  
  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
