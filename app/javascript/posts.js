// app/assets/javascripts/posts.js

$(function() {
  // All remote forms and links will be handled by Rails UJS
  // You can add custom handlers for ajax:success, ajax:error if needed

  $(document).on('ajax:success', 'form[data-remote]', function(event) {
    var [data, status, xhr] = event.detail;
    if (data.success && data.post) {
      $('#posts-list').append('<li>' + data.post.title + ': ' + data.post.content + '</li>');
      $(this)[0].reset();
    } else if (data.errors) {
      alert('Error: ' + data.errors.join(', '));
    }
  });

  $(document).on('ajax:error', 'form[data-remote]', function(event) {
    alert('An error occurred while processing the request.');
  });
});
