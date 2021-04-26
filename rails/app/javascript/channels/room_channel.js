// クライアントサイドの処理を担当する

import consumer from "./consumer"

const appRoom = consumer.subscriptions.create("RoomChannel", {

  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
    console.log(data);
  },

  // room_channel.rbのspeakアクションを呼び出す
  // 
  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.addEventListener("keypress", function(e) {

  // Enterが押されたか判定する
  if (e.keyCode === 13) {

    // room_channel.jsのspeakメソッドを発火する
    // テキストボックスに入力された値を取得して渡す
    appRoom.speak(e.target.value);

    // spaekメソッドの実行終了後
    e.target.value = '';
    e.preventDefault();
  }
})

// 画像ファイルがsubmitされたら実行
form.addEventListener('submit', handleFile);

// 送信されたファイルを操作
// channelを指定する
// 今回はroom_channel.rbを指定している
const handleFile = consumer.subscriptions.create("RoomChannel", {

  // room_channel.rbのspeakアクションからデータを受け取る
  received(data) {
    const messages = document.getElementById('messages');
    messages.insertAdjacentHTML('beforeend', data['message']);
  },

  file_controller: function(message) {
    return this.perform('file_controller', {message: message});
  }
});

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  },

  speak: function() {
    return this.perform('speak');
  }
});
