$(function () {
  $('.card-form__security__info').hide();
  $('.card-form__security__bottom').click(function () {
      $('.card-form__security__info').toggle();
      $('.submit-btn').toggle();
  });
});