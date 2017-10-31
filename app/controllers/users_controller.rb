class UsersController < ApplicationController
  def edit
  end

  def update
    if  current_user.update(users_params) then
      redirect_to controller: :messages, action: :index
    else
      render :edit
    end
  end

  private
    def users_params
    params.require(:user).permit(:name, :email)
    end
  end
