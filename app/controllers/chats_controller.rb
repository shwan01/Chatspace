class ChatsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
  end

  private
    def chat_params
      params.require(:chat).permit(
        :message
        )
end
