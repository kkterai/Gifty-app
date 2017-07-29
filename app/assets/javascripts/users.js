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
    this.username = username
  }

  userDescription (){
    return `<a href='/items/${this.id}'>${this.username}</a>` 
  }
}

// function capitalize(array) {
//     var capitalized = "";
//     debugger
//     for (var i=0; i < array.length; i++) {
//         var remainingChars = array[i] ? str.slice(1) : str.slice(1).toLowerCase();
//         capitalized = capitalized + " " + str.charAt(0).toUpperCase() + remainingChars;
//         debugger
//     }
//  return capitalized;
// };
