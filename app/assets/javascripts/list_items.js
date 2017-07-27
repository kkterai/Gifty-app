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

     let id = $(this).data("id");

     $.get("/list_items/" + id + ".json", function(listItemObject){
        let nextIndex
        let liArray = listItemObject.list_attributes

        // I would like to know if the top level list item matches the first nested list item. If so, view the next list_item, at index 1
        });
    //    var purchased = listItemObject.purchased ? "<p><strong>This Gift is on its way!</strong></p>" : "<p><strong>Not purchased</strong></p>"
       
    //    $("#purchase-" + id).html(purchased);
    //    $("#body-" + id).html(listItemObject.details);
        
    //    var comments = listItemObject.comments;
    //    var commentList = "";

    //    comments.forEach(function(comment) {
    //     commentList += '<li class="js-comment" data-id="' + comment["id"] + '">' + comment.content + '</li>';
    //    });

    //    $("#list-item-" + id + "-comments").html(commentList);
        });
    });
 });
