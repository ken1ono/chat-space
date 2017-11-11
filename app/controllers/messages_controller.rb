class MessagesController < ApplicationController

  before_action :group_find, only:[:index, :create]

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(messages_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path }
        format.json
      end
    else
      flash.now[:alert] = "メッセージを入力してください。"
      render :index
    end
  end

    private
      def messages_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
      end

      def group_find
        @group = Group.find(params[:group_id])
        @groups = current_user.groups.includes([:messages, :users])
        @messages = @group.messages.includes(:user)
      end
end

