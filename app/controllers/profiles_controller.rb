class ProfilesController < ApplicationController
  # Handled by the Devise gem
  before_action :authenticate_user!
  # Created by us
  before_action :only_current_user
  
  # GET to /users/:user_id/profile/new | This creates the profile
  def new
    # Render blank profile details form
    @profile = Profile.new
  end
  
  # POST to /users/:user_id/profile | This updates the profile
  def create
  	# Ensure that we have the user who is filling out form
  	@user = User.find( params[:user_id] )
  	# Create profile linked to this specific user
  	@profile = @user.build_profile( profile_params )
  	if @profile.save
  		flash[:success] = "Profile updated!"
  		redirect_to user_path(id: params[:user_id] )
  	else
  		render action: :new
  	end
  end
  	
	# GET to /users/:user_id/profile/edit
	def edit
	  @user = User.find( params[:user_id] )
    @profile = @user.profile
	end

  # PUT [or PATCH] to /users/:user_id/profile
  def update
    # Retrieve the user from the database
    @user = User.find( params[:user_id] )
    # Retrieve that user's profile
    @profile = @user.profile
    # Mass assign edited profile attributes and save (i.e. update)
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      # Redirect user to their profile page
      redirect_to user_path(id: params[:user_id] )
    else
      # If updating the profile fails, redirect the user to where they can edit their profile
      render action: :edit
    end
  end
    	
  private
  	def profile_params
  		params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
  	end
  	
  	def only_current_user
  	  @user = User.find( params[:user_id] )
  	  redirect_to(root_url) unless @user == current_user
  	end
end