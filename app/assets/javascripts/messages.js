window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
  $.getJSON(window.location.pathname + ".json", function(messages) {
    // this is the data you receive from http://localhost:3000/rooms/1/messages.json
    // loop through the messages and render them
    // you can use $(".messages").append("blah")
    // to add blah to the <div class="messages">...</div> element
     var e  = $('.list_messages');
     e.html('');
     for (i in messages)
     {
        message =  messages[i];
        e.append("<li class='list-group-item'><span class='tag tag-default tag-pill float-xs-right'>" +message.username+ "</span>" +message.content+ "</li>");
     }
  })
}

window.updateMessagesViaJS = function(){
  $.ajax({url: window.location.path, dataType:'script'});
}
