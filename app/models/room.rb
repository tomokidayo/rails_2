class Room < ApplicationRecord
  belongs_to :user
  
  def index
    @rooms = current_user.rooms
  end
end
