$(function(){
  function buildHTML(chat){
    var html = `<div class="content__chats__top">
                  <div class="content__chats__top__name">${chat.user_name}</div>
                  <div class="content__chats__top__time">${chat.created_at}</div>
                </div>
                <div class="content__chats__message">${chat.message}
                 </div>`
    return html;
  }

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
      $('field').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
})
