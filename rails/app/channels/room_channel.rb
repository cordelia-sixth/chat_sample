# サーバーサイドの処理を担当する

class RoomChannel < ApplicationCable::Channel

  # クライアントがサーバーに接続すると実行される
  def subscribed

    # クライアントサイドとデータの送受信を行う
    # 引数に /app/javascript/channels/ 以下のファイル名を指定すると
    # そのファイルとやり取りができる
    # 今回は room_channel.jsを指定している
    stream_from "room_channel"
  end

  # クライアントとサーバーの接続が解除されると実行される
  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # room_channel.jsでspeakメソッドが呼び出されると実行される
  # room_channel.jsから渡されたdataを受け取り
  # room_channel.jsのrecievedメソッドにブロードキャストする
  # 第一引数に渡したいjsファイル名
  # 第二引数に渡す値
  # def speak(data)
  #   ActionCable.server.broadcast 'room_channel', message: data['message']
  # end

  # テキストボックスに入力されたデータをDBに保存
  def speak(data)
    Message.create! content: data['message']
  end

  # 画像ファイルをpublic/に保存
  def file_controller(data)

    # 画像のパスを格納
    @img_paths = []

    # public/ 以下のjpgファイルの一覧を取得
    jpgs = Dir.glob(Rails.root.join('public', '*.jpg'))

    # 画像ファイルまでのパスを取得
    jpgs.each do |png|
      # ファイル名の先頭にスラッシュを挿入
      @img_paths.push('/' + File.basename(png))
    end
  end
end
