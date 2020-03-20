$(function(){
  $('.mypage--list--info').click(function () {
    $('.tab--list--info').show();
    $('.info-go-list').show();
    $('.tab--list--todo').hide();
    $('.todo-go-list').hide();
  });

  $('.mypage--list--todo').click(function () {
    $('.tab--list--todo').show();
    $('.todo-go-list').show();
    $('.tab--list--info').hide();
    $('.info-go-list').hide();
  });

  $('.goods-purchase--transaction').click(function () {
    $('.tab-list--transaction').show();
    $('.transaction-go-list').show();
    $('.tab-list--post').hide();
    $('.post-go-list').hide();
  });

  $('.goods-purchase--post').click(function () {
    $('.tab-list--post').show();
    $('.post-go-list').show();
    $('.tab-list--transaction').hide();
    $('.transaction-go-list').hide();
  });
  
})
 








