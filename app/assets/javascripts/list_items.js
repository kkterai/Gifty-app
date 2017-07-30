'use strict'
 
var listItemsValues

$(() => {
    addNewComments();
    nextListItem();
});

var currentArrayIndex = function() {
    for (var i = 0; i < listItemsValues.length; i++) { 
        if (listItemsValues[i].id === parseInt($(".js-next").attr("data-id")))
            return i;
    }
}

function nextListItem() {
    $(".js-next").on("click", function() {
        var id = $(".js-next").attr("data-id")
        $.get("/list_items/" + id + ".json", function(listItemObject) {
            listItemsValues = listItemObject.list_attributes;
        });

        
        var dataIdIndex = currentArrayIndex();
        var nextIndex = (dataIdIndex === listItemsValues.length - 1) ?  0 : dataIdIndex + 1
        var id = listItemsValues[nextIndex].id;

    $.get("/list_items/" + id + ".json", function(listItemObject) {
        var purchased = listItemObject.purchased ? " (This Gift is on its way!)" : "  "
        $(".comment-list").html("");

        $(".js-next").attr("data-id",id)
        $(".new_comment").attr("action","/list_items/" + id + "/comments")

        $('#item-name').html(listItemObject.item_name + purchased)
        $("#li-details").html(listItemObject.details)

        var comments = listItemObject.comments;
        var commentList = "";
        
        comments.forEach(function(comment) {
            if (comment.content !== null) {
                commentList += '<li class="js-comment" >' + comment.content + '</li>';
            }
        });

        $(".comment-list").html(commentList);
        
        });
    });
}

function addNewComments() {
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
        });
    });
}