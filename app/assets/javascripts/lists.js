'use strict'

// Expand each wish list item for more details

$(() => {
  $(".js-more").on('click', function() {
      var id = $(this).data("id");
     $.get("/list_items/" + id + ".json", function(listItemObject){
       var purchased = listItemObject.purchased ? "<p><strong>This Gift is on its way!</strong></p>" : "<p><strong>Not purchased</strong></p>"
       
       $("#purchase-" + id).html(purchased);
       $("#body-" + id).html(listItemObject.details);
        
       var comments = listItemObject.comments;
       var commentList = "";

       comments.forEach(function(comment) {
        commentList += '<li class="js-comment" data-id="' + comment["id"] + '">' + comment.content + '</li>';
       });

       $("#list-item-" + id + "-comments").html(commentList);

    });
  });
});
