class MessagesController < ApplicationController

  def index
    @groups = Group.find(1)
    @messages = Message.new
  end

  def create
    @message = Message.new(messages_params)
  end

  private
    def messages_params
    params.require(:message).permit(:message)
    end
end
