window.updateMessagesViaJSON = function() {
  path = window.location.pathname + ".json";
  console.log("I will update messages from " + path);
  jQuery.getJSON(path, function(data) {
    console.log("messages: ", data)
    $(".messages").html('');
    for (index in data) {
      message = data[index];
      console.log("current message: ", message);
      $(".messages").append("<div class='message'><strong>" + message.username + "</strong> " 
                              + message.content 
                              + "</div>")
    }
  });
}
