class UsersController < ApplicationController
  def show
    users = Users.all
  end
end
