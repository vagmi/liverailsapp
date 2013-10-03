class RoomsController < ApplicationController
  before_filter :authenticate, :except=>[:index]
  def index
    @rooms = Room.all
  end
  def new
    @room = Room.new
  end
  def create
    @room=Room.create(params.require(:room).permit(:name))
    if(@room.save)
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @room = Room.find(params[:id])
  end
end
