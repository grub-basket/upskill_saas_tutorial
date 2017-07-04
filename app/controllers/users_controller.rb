class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.includes(:profile)
    # Compared to using User.all, this reduces the load time by reducing the amount of queries made.
  end
  
  
  # GET to users/:id
  def show
    @user = User.find( params[:id] )
  end
  
end