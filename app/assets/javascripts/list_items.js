$(function() {
    $().on("some action", function(e) {
        // fire some ajax
        $.post( //values here
        ).done(function( msg ) {
                // get a response (it's the variable data)
            alert( "Data Saved: " + msg );
        });
    
        // load that response into the HTML of the page
        e.preventDefault();
    })
})