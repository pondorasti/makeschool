$(document).ready(function() {

  // SUBMIT POST FORM
  $('#comment-form').submit(function (e) {
    console.log('blah')
    e.preventDefault();

    var comment = $(this).serialize();

    var petId = window.location.pathname.split('/')[2]

    $.ajax({
      type: 'POST',
      url: '/pets/' + petId + "/comments",
      data: comment,
      success: function(data) {
        $('#comments').append('<p>' + data.body + '</p>');
      },
      error: function(err) {
        console.log(err);
      }
    });
  });

});