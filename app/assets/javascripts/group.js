// $(function(){
//   $('#group_user_ids').change(function(){
//     isChange = true;
//     console.log('isChange = true;')
//     });
// })
$(function(){
  $('#group_user_ids').keyup(checkChange(this));
  function checkChange(e){
      var old = v=$(e).find('#group_user_ids').val();
      return function(){
          v=$(e).find('#group_user_ids').val();
          if(old != v){
              old = v;
              name = $(this).val();
              console.log(name)
          }
      }
  }
})
