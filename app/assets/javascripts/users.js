'use strict'

$(() => {
  $.getJSON('/users', function (data) {
    var users = $()
    data.forEach(u => {
      var user = new User(u.id, u.username)
      users = users.add(`<p>${user.userDescription()}</p>`)
    })
    $('#users').html(users)
  })
})

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

$("#search").keyup(function () {
    alert("key up!!")
    var userInput = $(this).val();
    $("#users").map(function (index, value) {
        $(value).toggle($(value).text().toLowerCase().indexOf(userInput) >= 0);
    });
});
