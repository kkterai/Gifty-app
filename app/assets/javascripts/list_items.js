'use strict'

// Add new comments to wish list items

$(function() {
    $("#new_comment").on("submit", function(e) {
        
    $.ajax({
        type: "POST",
        url: this.action,
        data: $(this).serialize(),
        success: function(response) {
            $("#comment_content").val("");
            var $ol = $("div.comments ol");
            $ol.append(response);
        }
    })
         e.preventDefault();
    })
})

// Show each list_item individually, scroll using "next" link 
