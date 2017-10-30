class UsersController < ApplicationController


  def edit
    users = User.find(params[:id])
  end

  def update
    users = User.find(params[:id])
    users.update(users_params)
    redirect_to controller: :messages, action: :index
  end

  private
    def users_params
    params.require(:user).permit(:name, :email).merge(id: params[:id])
    end

end
