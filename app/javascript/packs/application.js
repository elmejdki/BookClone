// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
document.addEventListener('turbolinks:load', () => {
  const post_dropdowns = document.getElementsByClassName('dropdown-trigger');
  const dropdowns = document.getElementsByClassName('dropdown');
  const avatar_modal = document.getElementById('avatar-modal');
  const avatar_modal_button = document.getElementById('show-avatar-modal');
  const cover_modal = document.getElementById('cover-modal');
  const cover_modal_button = document.getElementById('show-cover-modal');
  const avatar_background = document.getElementById('avatar-modal-background');
  const avatar_close = document.getElementById('avatar-modal-close');
  const cover_background = document.getElementById('cover-modal-background');
  const cover_close = document.getElementById('cover-modal-close');
  const fileInput_3 = document.querySelector('#image-upload-js-3 input[type=file]');
  const fileInput_4 = document.querySelector('#image-upload-js-4 input[type=file]');
  const rooms_links = document.getElementsByClassName('room-linker');
  const notificaton_btn = document.getElementById('delete');
  const messages_body = document.querySelector(".messages-body");
  const message_menu = document.getElementById('message_menu');
  const fileInput = document.querySelector('#image-upload-js input[type=file]');

  const toggleMenu = (e) => {
    e.target.parentElement.parentElement.parentElement.classList.toggle('is-active');
    e.stopPropagation()
  }

  const hideMenu = (e) => {
    if(e.target.className.includes('post-action-container')) {
    }else {    
      Array.prototype.slice.call(dropdowns).forEach(item => {
          item.classList.remove('is-active');
      })
    }
  }

  const reload_page = (e) => {
    location.hash="num=" + parseInt(Math.random()*100)
  }

  window.addEventListener('hashchange', () => {
    location.reload();
    return false;
  })

  Array.prototype.slice.call(rooms_links).forEach(room_link => {
    room_link.addEventListener('click', reload_page);
  });

  Array.prototype.slice.call(post_dropdowns).forEach(item => {
    item.addEventListener('click', toggleMenu);
  });

  document.addEventListener('click', hideMenu);

  if(notificaton_btn){
    notificaton_btn.addEventListener('click', (e) => {
      e.target.parentElement.style.display = 'none'
    })
  }

  if (messages_body){
    messages_body.scrollTo(0,
      document.querySelector(".messages-body").scrollHeight);
  }

  message_menu.addEventListener('click', (e) => {
    e.target.classList.remove('message_notice')
  });

  if(fileInput) {
    fileInput.onchange = () => {
      if (fileInput.files.length > 0) {
        const fileName = document.querySelector('#image-upload-js .file-name');
        const icon = document.querySelector("#image-upload-js .file-icon").style.color = "#48c774";
        fileName.textContent = fileInput.files[0].name;
      }
    }
  }

  if(avatar_modal) {
    const close_action = () => {
      avatar_modal.classList.remove('is-active');
      cover_modal.classList.remove('is-active');
    }
    
    if (avatar_modal_button) {
      avatar_modal_button.addEventListener('click', () => {
        avatar_modal.classList.add('is-active');
      });

      cover_modal_button.addEventListener('click', () => {
        cover_modal.classList.add('is-active');
      });
    }

    avatar_close.addEventListener('click', close_action);
    avatar_background.addEventListener('click', close_action);
    cover_close.addEventListener('click', close_action);
    cover_background.addEventListener('click', close_action);

    fileInput_3.onchange = () => {
      if (fileInput_3.files.length > 0) {
        const fileName = document.querySelector('#image-upload-js-3 .file-name');
        const icon = document.querySelector("#image-upload-js-3 .file-icon").style.color = "#48c774";
        fileName.textContent = fileInput_3.files[0].name;
      }
    }

    fileInput_4.onchange = () => {
      if (fileInput_4.files.length > 0) {
        const fileName = document.querySelector('#image-upload-js-4 .file-name');
        const icon = document.querySelector("#image-upload-js-4 .file-icon").style.color = "#48c774";
        fileName.textContent = fileInput_4.files[0].name;
      }
    }
  }

  // burger menu JS code
  const menu = document.querySelector('.menu');
  const btn = menu.querySelector('.nav-tgl');
  btn.addEventListener('click', evt => {
    if (menu.className.indexOf('active') === -1) {
      menu.classList.add('active');
    } else {
      menu.classList.remove('active');
    }
  })

  const reaction_containers = document.querySelectorAll('.reaction-container');
  if (reaction_containers) {
    Array.prototype.slice.call(reaction_containers).forEach((container) => {
      const reaction_buttons = container.querySelectorAll('.likes, .dislikes');
      const like_items = reaction_buttons[0].querySelectorAll('span, i');
      const dislike_items = reaction_buttons[1].querySelectorAll('span, i');

      const react = (like_items, dislike_items) => {
        if ( like_items[0].classList.contains('has-text-base') ) {
          like_items[0].classList.remove('has-text-base');
          like_items[1].classList.remove('has-text-base');
          like_items[0].innerText = Number(like_items[0].innerText) - 1;
        }else {
          like_items[0].classList.add('has-text-base');
          like_items[1].classList.add('has-text-base');
          like_items[0].innerText = Number(like_items[0].innerText) + 1;
          
          if (dislike_items[0].classList.contains('has-text-base')) {
            dislike_items[0].classList.remove('has-text-base');
            dislike_items[1].classList.remove('has-text-base');
            dislike_items[0].innerText = Number(dislike_items[0].innerText) - 1;
          }
        }
      }

      container.addEventListener('click', (e) => {
        if (e.target.classList.contains('fas') && e.target.parentNode.parentNode.classList.contains('likes')) {
          react(like_items, dislike_items);
        }
        
        if (e.target.classList.contains('fas') && e.target.parentNode.parentNode.classList.contains('dislikes')) {
          react(dislike_items, like_items);
        }
      });
    })
  }

  const comment_container = document.querySelectorAll('.comment-container');
  if (comment_container) {
    Array.prototype.slice.call(comment_container).forEach((container) => {
      container.addEventListener('click', (e) => {
        if (e.target.classList.contains('fa-trash')) {
          e.target.parentNode.parentNode.parentNode.remove();
        }
      });
    });
  }

  window.addEventListener('resize', () => {
    const vh = window.innerHeight * 0.01;
    document.documentElement.style.setProperty('--vh', `${vh}px`);
  });
})
