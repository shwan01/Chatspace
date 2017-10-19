class ChatsController < ApplicationController
  before_action :group_find, only: [:index, :create]

  def index
    @groups = current_user.groups
    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.group_id = params[:group_id]
    if @chat.save
      flash.now[:notice] = "チャットを送信しました"
      render :index
    else
      flash.now[:alert] = "メッセージを入力してください"
      render :index
    end
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :image)
    end

    def group_find
      @group = Group.find(params[:group_id])
    end
end
