$(function() {
    $("#new_comment").on("submit", function(e) {
         url = this.action

    data = {
        'authenticity_token' : $("input[name = 'authenticity_token']").val(),
        'comment' : {
            'content' : $("#comment_content").val()
        }
    }
        
    $.ajax({
        type: "POST",
        url: url,
        data: data,
        success: function(response) {
            $("#comment_content").val("");
            var $ol = $("div.comments ol");
            $ol.append(response);
        }
    })
    //  3. take the data from the AJAX POST request and create the corresponding comment

    // 4. Send back HTML/JSON/JS of the comment that was added and inject it into the OL on the DOM
         e.preventDefault();
    })
})