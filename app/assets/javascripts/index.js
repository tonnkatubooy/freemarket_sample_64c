$(function() {

  //マウスを乗せたら発動
  $('.categoryBox').hover(function() {

    $('.parents').css('display', 'block');

  //ここにはマウスを離したときの動作を記述
  }, function() {

    $('.parents').css('display', 'none');

  });
});
