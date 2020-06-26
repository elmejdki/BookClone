import consumer from "./consumer"

document.addEventListener('turbolinks:load', () => {
  let room_id = null;
  const room_element = document.getElementById('room-id');  
  if(room_element) {
    room_id = Number(room_element.getAttribute('data-room-id'));
  }

  consumer.subscriptions.create({ channel: "RoomChannel", room_id }, {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      if(data.message.body != '') {
        const user_id = Number(document.getElementById('user-id').getAttribute('data-user-id'));
  
        const messages_container = document.getElementById('messages');
        const message = `
        <div class="wrapper ${data.message.user_id == user_id ? 'me' : ''}">
          <div class="message">
            ${data.message.body}
          </div>
          <div class="date">
            1 minute
          </div>
        </div>`;

        if (messages_container) {
          messages_container.innerHTML = messages_container.innerHTML + message;
        }
  
        const message_input = document.getElementById('message_body');
        message_input.value = '';
  
        document.querySelector(".messages-body").scrollTo(0,
          document.querySelector(".messages-body").scrollHeight);
      }
    }
  });
});