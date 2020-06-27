import consumer from "./consumer"

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const user_avatar = document.getElementById('user-avatar').querySelector('.profile-image');
    const avatar = user_avatar.getAttribute('src');
    const post = document.getElementById('post-'+data.post.id);

    if (post) {
      const comments_container = post.querySelector('.comments-container');
      const form = post.querySelector('.comment-form');
      const input = form.querySelector('#comment_text');
      const button = form.querySelector('.btn.is-success');
      const comments_counter = post.querySelector('.comments span');

      comments_counter.innerText = data.n_comments;
 
      button.disabled = false;
      input.value = '';
  
      const comment = `
      <div class="comment-container">
        <div class="comment">
          <div class="user-avatar">
            <a href="/users/${data.user.id}">
              <img class="profile-image" src="${avatar}">
            </a>
          </div>
          <div class="comment-body">
            <div class="flex">
              <span class="user-name">${data.user.username}</span>
              ${data.comment.text}
            </div>
          </div>
        </div>
        <div class="comment-action">
          <a rel="nofollow" data-method="delete" href="/posts/${data.post.id}/comments/${data.comment.id}"><i class="fa fa-trash"></i></a>
          <span class="comment-date">less than a minute, ago</span>
        </div>
      </div>`;

      comments_container.innerHTML = comments_container.innerHTML + comment

      const comment_container = comments_container.querySelectorAll('.comment-container');

      if (comment_container) {
        Array.prototype.slice.call(comment_container).forEach((container) => {
          container.addEventListener('click', (e) => {
            if (e.target.classList.contains('fa-trash')) {
              e.target.parentNode.parentNode.parentNode.remove();
            }
          });
        });
      }
    }
  }
});
