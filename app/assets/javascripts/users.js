'use strict'

class User {
  constructor (id, username) {
    this.id = id
    this.username = capitalize(username)
  }
  userDescription (){
    return `<a href='/lists/${this.id}'>${this.username}</a>` 
  }
}

function capitalize(username) {
    function nameArray(username) { 
        var ary;
        if (username.includes("_")) {
            ary = username.split("_") 
        } else {
            ary = username.split(".");
        } 
      return ary;
    }
    var array = nameArray(username)
    var capitalized = "";
    for (var i=0; i < array.length; i++) {
        var str = array[i];
        var remainingChars = str.slice(1);
        capitalized = capitalized + " " + str.charAt(0).toUpperCase() + remainingChars;
    }
 return capitalized;
};


// function search() {
//     debugger
//     var input, filter, div, p, a, i;
//     input = document.getElementById("#search");
//     filter = input.value.toUpperCase();
//     div = document.getElementById("#users");
//     p = div.getElementsByTagName('p');
    
//     // Loop through all list items, and hide those who don't match the search query
//     for (i = 0; i < p.length; i++) {
//         a = p[i].getElementsByTagName("a")[0];
//         if (a.innerHTML.toUpperCase().indexOf(filter) > -1) {
//             p[i].style.display = "";
//         } else {
//             p[i].style.display = "none";
//         }
//      }
//    }

$(document).ready(function() {
    $.getJSON('/users', function (data) {
    var users = $()
    data.forEach(u => {
      var user = new User(u.id, u.username)
      users = users.add(`<p>${user.userDescription()}</p>`)
    })
    $('#users').html(users)
  })
});