jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('.thumbnail').click(function() {
    $(this).parent('form').submit();
  });
  return this;
}

$(function() {
  $('.new_vote').submitOnCheck();
});
