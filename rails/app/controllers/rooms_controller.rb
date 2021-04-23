class RoomsController < ApplicationController
  
  def show
    # 投稿されたメッセージの一覧
    @messages = Message.all
  end
end
