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

  Array.prototype.slice.call(post_dropdowns).forEach(item => {
    item.addEventListener('click', toggleMenu);
  });

  document.addEventListener('click', hideMenu);

  const notificaton_btn = document.getElementById('delete')

  if(notificaton_btn){
    notificaton_btn.addEventListener('click', (e) => {
      e.target.parentElement.style.display = 'none'
    })
  }

  const messages_body = document.querySelector(".messages-body");
  if (messages_body){
    messages_body.scrollTo(0,
      document.querySelector(".messages-body").scrollHeight);
  }
})