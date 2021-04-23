# バックグラウンドで実行したい処理を管理する

class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # room_channel.jsのreceived()にブロードキャストする
    # 第一引数に送信先のファイル名
    # 第二引数に送りたいデータ
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
    def render_message(message)
      # 部分テンプレート（partial）を呼び出す
      # ApplicationController.renderer()はcontrollerのアクションの制約を受けずに任意のviewをレンダリングできる
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
