'use strict'

// Add new comments to wish list items

$(function() {
    $("#new_comment").on("submit", function(e) {
    e.preventDefault();
    $.ajax({
        type: "POST",
        url: this.action,
        data: $(this).serialize(),
        success: function(response) {
            $("#comment_content").val("");
            var $ol = $("div.comments ol");
            $ol.append(response);
        }
        //success deprecated?
      });
   });
});

// Show each list_item individually, scroll using "next" link 

$(function() {
    $('.js-next').on('click', function(e) {
    debugger
  });
});
