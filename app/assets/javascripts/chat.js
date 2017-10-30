$(function(){
  function buildHTML(chat){
    if(chat.image.url == null){
      var html =`<div class="chat" data-chat-id=${chat.id}>
                <div class="content__chats__top">
                  <div class="content__chats__top__name">${chat.user_name}</div>
                  <div class="content__chats__top__time">${chat.created_at}</div>
                </div>
                <div class="content__chats__message">${chat.message}
                 </div></div>`
    } else {
      var html = `<div class="chat data-chat-id=${chat.id}">
                  <div class="content__chats__top">
                    <div class="content__chats__top__name">${chat.user_name}</div>
                    <div class="content__chats__top__time">${chat.created_at}</div>
                  </div>
                  <div class="content__chats__message">${chat.message}
                   </div>
                  <div class="content__chats__image">
                    <img src="${chat.image.url}">
                  </div></div>`
    }
    return html;
  }
  // <img src="${chat.image}">
  $('#new_chat').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url :url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.content__chats').append(html)
      $('.field').val('')
    })
    .fail(function(){
      alert('error');
    })
    $("html, body").animate({scrollTop:$(document).height()});
  })
})

$(function(){
  function loadHTML(chat){
    if(chat.image.url == null){
      var html =`<div class="chat" data-chat-id=${chat.id}>
                  <div class="content__chats__top">
                  <div class="content__chats__top__name">${chat.user_name}</div>
                  <div class="content__chats__top__time">${chat.created_at}</div>
                </div>
                <div class="content__chats__message">${chat.message}
                 </div></div>`
    } else {
      var html = `<div class="chat" data-chat-id=${chat.id}>
                  <div class="content__chats__top">
                    <div class="content__chats__top__name">${chat.user_name}</div>
                    <div class="content__chats__top__time">${chat.created_at}</div>
                  </div>
                  <div class="content__chats__message">${chat.message}
                   </div>
                  <div class="content__chats__image">
                    <img src="${chat.image.url}">
                  </div></div>`
    }
    return html;
  }
  $(window).on('load', function(){
    var interval = setInterval(function(){
      if (window.location.href.match(/\/groups\/\d+\/chats/)) {
    var chat_id = $('.chat:last').data('chat-id');
    $.ajax({
      url: location.href,
      type: 'GET',
      dataType : 'json'
    })
    .done(function(chat) {
      // var id = $('.chat').data('chat-id');
      // console.log(id)
      var insertHTML = '';
      // $.each(json, function(i, chat) {
      chat.forEach(function(c){
        if (c.id > chat_id){
          insertHTML += loadHTML(c);
        }
      });
      $('.content__chats').append(insertHTML);
    })
    .fail(function() {
      alert('自動更新に失敗しました');
    });
    $("html, body").animate({scrollTop:$(document).height()});
  } else {
    clearInterval(interval);
   }} , 5 * 1000 );
  });
});
