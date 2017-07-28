'use strict'

var listItemsValues

$(() => {
    $(window).load(function() {
        var id = $('#js-load').attr('data-id')
        $.get("/list_items/" + id + ".json", function(listItemObject){
        listItemsValues = listItemObject.list_attributes;
        });
    });
});

var currentArrayIndex = function() {
    for (var i = 0; i < listItemsValues.length; i++) { 
            if (listItemsValues[i].id === parseInt($(".js-next").attr("data-id")))
                return i
        }
    }

// Add new comments to wish list items

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

// Show each list_item individually, scroll using "next" link 
$(function() {
    $('.js-next').on('click', function() {
        var nextIndex
        var dataIdIndex = currentArrayIndex()

    if (dataIdIndex === listItemsValues.length - 1)
        nextIndex = 0
    else
        nextIndex = dataIdIndex + 1
 
    $.get("/list_items/" + listItemsValues[nextIndex].id + ".json", function(listItemObject) {
        $('#item-name').html(listItemObject.item_name)
        $("#li-details").html(listItemObject.details)
        
        var comments = listItemObject.comments;
        var commentList = "";

        comments.forEach(function(comment) {
            commentList += '<li class="js-comment" data-id="' + comment["id"] + '">' + comment.content + '</li>';
        });

        $("#list-item-" + id + "-comments").html(commentList);

        var purchased = listItemObject.purchased ? "<p><strong>This Gift is on its way!</strong></p>" : "<p><strong>Not purchased</strong></p>"
       
        $("#purchase-" + id).html(purchased);
      
        });
    });
});