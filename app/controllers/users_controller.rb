class UsersController < ApplicationController
  def edit
  end

  def update
    if  current_user.update(users_params) then
      render "messages/index"
    else
      render :edit
    end
  end

  private
    def users_params
    params.require(:user).permit(:name, :email)
    end
  end
