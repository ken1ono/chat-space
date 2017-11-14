  $(document).on('turbolinks:load', function(){

  var timer;

  function buildHTML(message){
    var img = message.image !== null ? `<img alt="${message.image}" src="${message.image}" />` : "" ;
    var html = `<div class= "chat-main__message" data-message-id="${message.id}">
                  <p class="chat-main__message-name">
                    ${message.name}
                  </p>
                  <p class="chat-main__message-time">
                    ${message.created_at}
                  </p>
                <div class= "chat-main__message-body">
                  <h3>
                    ${message.body}
                  </h3>
                </div>
                    ${img}
                </div>`;
    return html
    }

  $('.new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
     })

    .done(function(data){
      var html = buildHTML(data);
      $('.chat-main__body').append(html)
      $('.send').attr('disabled', false);
      $('#message_body').val('')
      $('#message_image').val('')
      $('.chat-main__body').animate({scrollTop: $('.chat-main__body')[0].scrollHeight}, 'linear');
    })
    .fail(function(){
      alert('error');
      $('.send').attr('disabled', false);
    })
  });

  function updated() {
    var last_message = $(".chat-main__message").last().data("message-id");
    var url = location.pathname ;
    $.ajax({
      url: url,
      type: "GET",
      data: {"last_message_id" : last_message},
      dataType: 'json',
    })
    .done(function(data) {
      for(message of data){
        var html = buildHTML(message);
        $('.chat-main__body').append(html)
      }
    })
  }
  if (window.location.href.match(/\/groups\/\d{1,}\/messages/)) {
    timer = setInterval(updated, 5000);
  } else {
    clearInterval(timer);
  }
});
