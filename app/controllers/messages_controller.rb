class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
    @messages = Message.new
  end

  def create
    @messages = Message.new(messages_params)
    if @messages.save
      redirect_to group_messages_path
    else
      render "index", notice: "グループを入力してください。"
    end
  end

    private
      def messages_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
    end
end

