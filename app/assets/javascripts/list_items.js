$(function() {
    $("#new_item").on("submit", function(e) {
        // hijack form
        // fire some ajax
        //  1. need the URL to submit the POST request to
        url = this.action
        //  2. we need the form data
        data = 
        //  3. send a POST request to the correct place 
        //  (where the form would have submitted anyway)
        // load that response into the HTML of the page
        e.preventDefault();
    })
})