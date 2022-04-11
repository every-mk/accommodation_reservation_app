class RoomsController < ApplicationController
  def index
  end

  def new
    @room = current_user.room.build()
  end

  def create
    @room = current_user.room.build(configure_room_create_params)
    @room.image_name = get_room_image_name

    if @room.save
      update_room_room_image(@room.id, @room.image_name)
      redirect_to @room, notice: "Room was successfully created."
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new()
  end

  def posts
  end

  def search
    @rooms = Room.where(['address LIKE(?) AND name LIKE(?)', "%#{search_param[:area]}%", "%#{search_param[:keyword]}%"])
  end

  private

  def get_room_image_name
    params.require(:room).permit(:room_image)[:room_image].original_filename
  end

  def update_room_room_image(room_id, image_name)
    Dir.mkdir("public/uploads/room/image/#{room_id}")
    File.binwrite("public/uploads/room/image/#{room_id}/#{image_name}", params.require(:room).permit(:room_image)[:room_image].read)
  end

  def configure_room_create_params
    params.require(:room).permit(:name, :introduce, :price, :address)
  end

  def search_param
    params.permit(:area, :keyword)
  end
end
