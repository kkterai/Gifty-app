'use strict'

// Expand each wish list item for more details

$(() => {
  $(".js-more").on('click', function() {
     $.get(`/list_items/${$(this).data("id")}.json`, function(listItemObject){
       // console.log(listItemObject)
       // console.log(listItemObject.comments)
       console.log(listItemObject.details)
    });
  });
});

// Then show each one individually, scroll using "next" link 