class UsersController < ApplicationController

  def index
    @users = User.where('name LIKE(?)', "%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def edit
  end

  def update
    if  current_user.update(users_params) then
        redirect_to messages_path
    else
      render :edit
    end
  end

  private
    def users_params
    params.require(:user).permit(:name, :email)
    end
  end
