$(function() {
    $("#new_comment").on("submit", function(e) {
        
    $.ajax({
        type: "POST",
        url: this.action,
        data: $(this).serialize();,
        success: function(response) {
            $("#comment_content").val("");
            var $ol = $("div.comments ol");
            $ol.append(response);
        }
    })

         e.preventDefault();
    })
})