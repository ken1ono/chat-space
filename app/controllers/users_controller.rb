class UsersController < ApplicationController
  def edit
  end

  def update
    if  current_user.update(users_params) then
      redirect_to messages_path
    else
      redirect_to edit_user_path
    end
  end

  private
    def users_params
    params.require(:user).permit(:name, :email)
    end
  end
