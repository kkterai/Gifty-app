$(function () {
  $(".js-more").on('click', function() {
    console.log($(this).data['list_items'][0]['id'])
  })
});