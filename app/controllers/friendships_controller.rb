class FriendshipsController < ApplicationController
  def index
     @user = current_user
     @user_friendships = Friendship.get_user_friendships(@user)
     @user_pending_friendships = Friendship.user_pending_friendships(@user)
     @data = {current_friend:@user_friendships, pending_friends: @user_pending_friendships}
     render json: @data
  end

  def new
    @sender = current_user
    @friendship = @sender.friendships.new(acceptor_id: params[:acceptor_id])
     if @friendship.save
       redirect_to "/users/index"
     else
       @errors = @friendship.errors.full_messages
     end
  end

  def edit
    @acceptor = User.find_by(id: params[:id])
    @friendship = Friendship.find_by_sender_id_and_acceptor_id(current_user.id, @acceptor.id)
    @friendship.accepted = true
    if @friendship.save
      redirect_to "/users/index"
    else
      @errors = @friendship.errors.full_messages
      redirect_to "/users/index"
    end
  end

  def destroy
    @user_being_deleted = User.find_by(id: params[:id])
    @friendship = Friendship.find_by_sender_id_and_acceptor_id(current_user.id, @user_being_deleted.id)
    @friendship.destroy
    redirect_to "profile"
  end

  def friendship_params
    params.require(:friendship).permit(:acceptor_id)
  end

end
