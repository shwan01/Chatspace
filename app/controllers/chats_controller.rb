class ChatsController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.user_id = current_user.id
    @chat.group_id = params[:group_id]
    if @chat.save
      redirect_to group_chats_path, notice: 'チャットを送信しました'
    else
      redirect_to group_chats_path, alert: 'メッセージを入力してください'
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :image)
    end
end
