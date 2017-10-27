$(function(){

var search_list = $(".js-user-seaerch-result");

function appendUser(user){
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name} id="addbtn">追加</a>
              </div>`
  search_list.append(html);
}

function appendNewUser(id, name){
  var newhtml = `<div class='chat-group-user clearfix js-chat-member' id='chat-group-user-${id}'>
                <input name='group[user_ids][]' type='hidden' value='${id}' />
                <p class='chat-group-user__name'>${name}</p>
                <a class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn' id="delbtn" data-div-id='chat-group-user-${id}'>削除</a>
              </div>`
  return newhtml;
}

  $('#search').on("keyup", function() {
    var input = $('#group_user_ids').val();
    console.log(input)

    $.ajax({
      type: 'GET',
      url: '/users',
      data: { input: input},
      dataType: 'json'
    })

    .done(function(users){
      $(".js-user-seaerch-result").empty();
      if (users.length !== 0){
        users.forEach(function(user){
          appendUser(user);
        });
      }
    })
    .fail(function(){
      alert('ユーザー検索に失敗しました');
    });
  });

  $(document).on("click", "#addbtn", function(){
    $(".js-user-seaerch-result").empty();
    var id = $(this).data("user-id");
    var name = $(this).data("user-name");
    var newhtml = appendNewUser(id, name);
    $('.chat-group-users.js-add-user').append(newhtml);
  });

  $(document).on("click", "#delbtn", function(){
    var id = $(this).data("div-id");
    $(`#${id}`).empty();
  });
})
