class RoomsController < ApplicationController
  def index
    @rooms = Room.all # Roomモデルから全てのデータを取得
  end
  def my_rooms
    @rooms = current_user.rooms # ログインユーザーが所有する部屋を取得
    render :index # indexビューを再利用して表示
  end
  def new
    @room = Room.new
  end
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
  def search
    @rooms = Room.all
    if params[:area].present?
      @rooms = @rooms.area_search(params[:area])
    end
    if params[:keyword].present?
      @rooms = @rooms.keyword_search(params[:keyword])
    end
    render :index
  end
  private
  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end
