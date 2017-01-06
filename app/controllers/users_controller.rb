class UsersController < ApplicationController
  def index
    @display_users= User.all
  end


end
