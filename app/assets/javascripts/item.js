$(function(){
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <label class="image_box-icon" for="item_pictures_attributes_${index}_image">
                    <i class='fa fa-camera likeIcon'></i>
                    <input class="hidden" type="file"
                    name="item[pictures_attributes][${index}][image]"
                    id="item_pictures_attributes_${index}_image"></div>`;
    return html;
  }

  const buildImg = (index, url)=> {
    const html = `<img data-index="${index}" src="${url}">`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box__container').on('change', '.hidden', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    $('#image-box__container').before(buildImg(targetIndex, blobUrl));

    $('#image-box__container').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });



  $('#image-box__container').on('click', '.js-remove', function() {
    $(this).parent().remove();
    if ($('.hidden').length == 0) $('#image-box__container').append(buildFileField(fileIndex[0]));
  });
});