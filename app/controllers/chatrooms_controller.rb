class ChatroomsController < ApplicationController

  def show
    @chatroom = Chatroom.find(params[:id])
    @second_chat_user = find_second_chat_user
    @message = Message.new
    @art = Art.new
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

  private

  def find_second_chat_user
    if @chatroom.requester_id == current_artist.id
      Artist.find(@chatroom.requestee_id)
    else
      Artist.find(@chatroom.requester_id)
    end
  end

end
