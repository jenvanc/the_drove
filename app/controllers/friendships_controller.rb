class FriendshipsController < ApplicationController
  def index
    @user = current_user
    @user_friendships = Friendship.get_user_friendships(@user)
    @user_pending_friendships = Friendship.user_pending_friendships(@user)
    @user_friendships.to_json
    @user_pending_friendships.to_json
  end

  def create
    @sender = current_user
    @acceptor = User.find(params[:id])
    @friendship = @sendor.friendships.new(acceptor_id: @acceptor.id)
    if @friendship.save
      redirect_to @sender
    else
      @errors = @friendship.errors.full_messages
      render "show"
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.accepted = true
    if @friendship.save
      redirect_to current_user
    else
      @errors = @friendship.errors.full_messages
      render "show"
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_to current_user
  end

end
