class RoomsController < ApplicationController
  def index
    @rooms = Room.all # Roomモデルから全てのデータを取得
  end


  def new
    @room = Room.new
  end

# app/controllers/rooms_controller.rb
def show
  @room = Room.find(params[:id])
end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

    # エリア検索のアクション
    def area_search
      @rooms = Room.area_search(params[:keyword])
      render :index
    end
  private

  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
