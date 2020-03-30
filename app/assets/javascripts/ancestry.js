$(function(){
  $("category_parents").hover(function(){
    var parentValue = $("category_parents").value;
    $.ajax({
      url: '/items/search',
      type: "GET",
      data: {
        parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
      },
      dataType: 'json'
    });
  });
});
