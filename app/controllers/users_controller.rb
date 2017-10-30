class UsersController < ApplicationController

  before_action :find_id, except: :users_params

  def edit
  end

  def update
    @users.update(users_params)
    redirect_to messages_path
  end

  private
    def users_params
    params.require(:user).permit(:name, :email)
    end

    def find_id
      @users = User.find(params[:id])
    end
  end
