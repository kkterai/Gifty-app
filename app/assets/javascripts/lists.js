'use strict'

// Expand each wish list item for more details

$(() => {
  $(".js-more").on('click', function() {
    //dynamically pull out the idea of the More button clicked and append it to the url of the get request below
    $.get('/list_items/31.json', function(listItemObject){

      // console.log(listItemObject)
      // console.log(listItemObject.comments)
      console.log(listItemObject.details)
    })
  })
});

// Then show each one individually, scroll using "next" link 