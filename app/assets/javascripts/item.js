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
                  <label class="image_box-icon" for="item_pictures_attributes_0_image">
                   <i class='fa fa-camera likeIcon'></i>
                    <input class="hidden" type="file"
                    name="item[pictures_attributes][${index}][image]"
                    id="item_pictures_attributes_${index}_image"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box__container').on('change', '.hidden', function(e) {
    $('#image-box__container').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box__container').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.hidden').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
  });
});







  //画像の複数投稿機能
