$(function() {
    $("#new_comment").on("submit", function(e) {
         url = this.action

    data = {
        'authenticity_token' : $("input[name = 'authenticity_token']").val(),
        'comment' : {
            'content' : $("#comment_content").val()
        }
    }
        
    console.log(data)
    //     $.ajax({
    //         type: "POST",
    //         url: url,
    //         data: data,
    //         success: function(response) {
    //             var $td = $("div#list_items td")
    //             $td.append(response);
    //         }
    //     })
    //     //  3. take the data from the AJAX POST request and create the corresponding list_item

    //     // 4. Send back HTML/JSON/JS of the list_item that was added and inject it into the OL on the DOM
         e.preventDefault();
    })
})