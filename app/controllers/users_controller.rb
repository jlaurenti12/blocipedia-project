class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def downgrade
    @user = User.find(params[:id])
    @user.downgrade

    if @user.save
      flash[:notice] = "You've been downgraded to standard. Your private wikis are now public."
      redirect_to edit_user_registration_path
    else
      flash[:error] = "There was an error updating your account. Please try again."
      redirect_to downgrade_user_path
    end
  end

  def index
    @users = User.all
  end

end
