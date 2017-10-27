$(function(){

var search_list = $(".js-user-seaerch-result");

function appendUser(user){
  var html = `<div class="chat-group-user clearfix">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
              </div>`
  search_list.append(html);
}

  $('#group_user_ids').on("keyup", function() {
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
})
