import consumer from "./consumer"

consumer.subscriptions.create("MessageNotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },
  
  disconnected() {
    // Called when the subscription has been terminated by the server
  },
  
  received(data) {
    let user_id = null;
    let room_id = null;
    const room_element = document.getElementById('room-id');  
    if(room_element) {
      room_id = Number(room_element.getAttribute('data-room-id'));
    }
    
    const user_element = document.getElementById('user-id');  
    if(user_element){
      user_id = Number(user_element.getAttribute('data-user-id'));
    }

    const room = data.notified_room.id
    if(room != room_id) {
      if(user_id != data.user){
        const room_container = document.getElementById('room-' + room)
        if(room_container) {
          room_container.innerHTML = room_container.innerHTML + "<div class=\"message-notice\"></div>"
        }
      }

      if(data.side_user == user_id){
        const message_menu = document.getElementById('message_menu');
        if(!message_menu.classList.contains('message_notice')){
          message_menu.classList.add('message_notice')
        }
      }
    }

    const messages_countner = document.getElementById('new-messages');
    if(messages_countner) {
      messages_countner.classList.remove('d-non');
      messages_countner.innerText = data.dead_rooms;
    }

  }
});