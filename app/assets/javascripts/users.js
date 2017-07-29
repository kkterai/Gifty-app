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
      return ary
    }
    var array = nameArray(username)
    var capitalized = "";
    for (var i=0; i < array.length; i++) {
        var str = array[i]
        var remainingChars = str ? str.slice(1) : str.slice(1).toLowerCase();
        capitalized = capitalized + " " + str.charAt(0).toUpperCase() + remainingChars;
    }
 return capitalized;
};
