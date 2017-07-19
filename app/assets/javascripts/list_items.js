$(function() {
    $().on("some action", function(e) {
        // fire some ajax
        $.ajax({ //http://api.jquery.com/jquery.ajax/
            method: "POST",
            url: "some.php",
            data: { name: "John", location: "Boston" }
        })
        .done(function( msg ) {
            alert( "Data Saved: " + msg );
        });
        // get a response
        // load that response into the HTML of the page
        e.preventDefault();
    })
})