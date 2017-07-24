$(function() {
    $("#new_item").on("submit", function(e) {
        // hijack submit event
        //  1. need the URL to submit the POST request to
        url = this.action
        //  2. we need the form data to send to the server as an AJAX post
        //  (where the form would have submitted anyway)
       
        data = {
            'authenticity_token' : $("input[name = 'authenticity_token']").val(),
            'item' : {
                'name' : $("#item_name").val()
            }
        }
        
        $.ajax({
            type: "POST",
            url: url,
            data: data,
            success: function(response) {
                var $ol = $("div.list_items ol")
                $ol.append(response);
            }
        })
        //  3. take the data from the AJAX POST request and create the corresponding list_item

        // 4. Send back HTML/JSON/JS of the list_item that was added and inject it into the OL on the DOM
        e.preventDefault();
    })
})