$(function(){
  //画像のプレビュー表示
  var file_field = document.querySelector('input[type=file]')
  $('.hidden').change(function(){
   var file = $('input[type="file"]').prop('files')[0];
   var fileReader = new FileReader();

   fileReader.onloadend = function() {
     var src = fileReader.result
     var html= `<img src="${src}">`
     $('#image-box__container').before(html);
   }
   fileReader.readAsDataURL(file);
  });

//画像の複数枚投稿
const buildFileField = (index)=> {
  const html = `<div data-index="${index}" class="js-file_group">
                  <input class="hidden" type="file"
                  name="item[pictures_attributes][${index}][image]"
                  id="item_pictures_attributes_${index}_image">
                </div>`;
  return html;
}

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box__container').on('change', '.hidden', function(e) {
    $('#image-box__container').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box__container').on('click', '.delete-btn', function() {
    $(this).parent().remove();
    if ($('.hidden').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
  });
});

// 投稿編集時
    //mypage/:i/editページへリンクした際のアクション=======================================
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      //登録済み画像のプレビュー表示欄の要素を取得する
      var prevContent = $('.label-content').prev();
      //プレビューにidを追加
      $('.image_box-right').each(function(index, box){
        $(box).attr('id', `image_box-right__${index}`);
      })
      //削除ボタンにidを追加
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete-box_${index}`);
      })
      $('.update-box').each(function(index, box){
        $(box).attr('id', `update_btn_${index}`);
      })
      var count = $('.image_box-right').length;
      //プレビューが5あるときは、投稿ボックスを消しておく
      if (count == 5) {
        $('.label-content').hide();
      }
    }
    //=============================================================================

    
    // ラベルのwidth操作
    function setLabel() {
      //プレビューボックスのwidthを取得し、maxから引くことでラベルのwidthを決定
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
    }

    // プレビューの追加
    $(document).on('change', '.image_box-right', function() {
      setLabel();
      //hidden-fieldのidの数値のみ取得
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      //labelボックスのidとforを更新
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      //選択したfileのオブジェクトを取得
      var file = this.files[0];
      var reader = new FileReader();
      //readAsDataURLで指定したFileオブジェクトを読み込む
      reader.readAsDataURL(file);
      //読み込み時に発火するイベント
      reader.onload = function() {
        var image = this.result;
        //プレビューが元々なかった場合はhtmlを追加
        if ($(`#image_box-right__${id}`).length == 0) {
          var count = $('.image_box-right').length;
          var html = buildHTML(id);
          //ラベルの直前のプレビュー群にプレビューを追加
          var prevContent = $('.label-content').prev();
          $(prevContent).append(html);
        }
        //イメージを追加
        $(`#image_box-right__${id} img`).attr('src', `${image}`);
        var count = $('.image_box-right').length;
        //プレビューが5個あったらラベルを隠す 
        if (count == 5) { 
          $('.label-content').hide();
        }

        //プレビュー削除したフィールドにdestroy用のチェックボックスがあった場合、チェックを外す=============
        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        //=============================================================================

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        if(count < 5){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    // 画像の削除
    $(document).on('click', '.delete-box', function() {
      var count = $('.image_box-right').length;
      setLabel(count);
      var id = $(this).attr('id');
      $(`#image_box-right__${id}`).remove();
      console.log("test");

      //新規登録時と編集時の場合分け==========================================================

      //新規投稿時
      //削除用チェックボックスの有無で判定
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        //フォームの中身を削除 
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

        }
      } else {

        //投稿編集時
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        //5個めが消されたらラベルを表示
        if (count == 4) {
          $('.label-content').show();
        }

        //ラベルのwidth操作
        setLabel();
        //ラベルのidとforの値を変更
        //削除したプレビューのidによって、ラベルのidを変更する
        if(id < 5){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
      //=============================================================================
    });
    $(document).on('click', '.update-box', function() {
      var count = $('.image_box-right').length;
      setLabel(count);
      console.log(this)
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#image_box-right__${id}`).remove();
    });