$(function(){
  $('.mypage--list--info').click(function () {
    $('.tab--list--info').show();
    $('.tab--list--todo').hide();
  });

  $('.mypage--list--todo').click(function () {
    $('.tab--list--todo').show();
    $('.tab--list--info').hide();
  });

  $('.goods-purchase--transaction').click(function () {
    $('.tab-list--transaction').show();
    $('.tab-list--post').hide();
  });

  $('.goods-purchase--post').click(function () {
    $('.tab-list--post').show();
    $('.tab-list--transaction').hide();
  });

});


$('.mypage--list--info').on('click', function(){
	$(this).addClass('&--info:active');
});


















// $(function(){
// 	//分割したい個数を入力
// 	var division = 10;
	
// 	//要素の数を数える
// 	var divlength = $('.tab-list--info .li').length;
// 	//分割数で割る
// 	dlsizePerResult = divlength / division;
// 	//分割数 刻みで後ろにmorelinkを追加する
// 	for(i=1;i<=dlsizePerResult;i++){
// 		$('.tab-list--info .li').eq(division*i-1)
//                 .after('<span class="mypage-go-list link'+i+'">続きを読む</span>');
// 	}
// 	//最初のli（分割数）と、morelinkを残して他を非表示
// 	$('.tab-list--info .li,.morelink').hide();
// 	for(j=0;j<division;j++){
// 		$('.tab-list--info .li').eq(j).show();
// 	}
// 	$('.morelink.link1').show();
	
// 	//morelinkにクリック時の動作
// 	$('.morelink').click(function(){
// 		//何個目のmorelinkがクリックされたかをカウント
// 		index = $(this).index('.morelink');
// 		//(クリックされたindex +2) * 分割数 = 表示数
// 		for(k=0;k<(index+2)*division;k++){
// 			$('.tab-list--info .li').eq(k).fadeIn();
// 		}
		
// 		//一旦全てのmorelink削除
// 		$('.morelink').hide();
// 		//次のmorelink(index+1)を表示
// 		$('.morelink').eq(index+1).show();
	
// 	});
	
// });