class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    check_room = Chatroom.where(requester_id: current_artist.id, requestee_id: params[:artist_id]).or(Chatroom.where(requester_id: params[:artist_id], requestee_id: current_artist.id))
    if check_room.any?
      @chatroom = Chatroom.find(check_room[0].id)
      redirect_to chatroom_path(@chatroom)
    else
      requester_artist = current_artist.id
      requestee_artist = (params[:artist_id]).to_i
      @chatroom = Chatroom.new(name: "chat", requester_id: requester_artist, requestee_id: requestee_artist)
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        render 'artists/show', status: :unprocessable_entity
      end
    end
  end
end
