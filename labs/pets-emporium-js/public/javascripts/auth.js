$(document).ready(function() {

  var authToken = Cookies.get('token');
  if (authToken) {
    $('.authenticated').show()
  } else {
    $('.unauthenticated').show()
  }

  $('#login-form').submit(function (e) {
    e.preventDefault();

    var user = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/login',
      data: user,
      success: function(data) {
        console.log(data.token);
        Cookies.set('token', data.token);
        window.location.href = "/"
      },
      error: function(err) {
        console.log(err);
      }
    });
  });

  $('#sign-up-form').submit(function (e) {
    e.preventDefault();

    var user = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/sign-up',
      data: user,
      success: function(data) {
        console.log(data);
        Cookies.set('token', data.token);
        window.location.href = "/"
      },
      error: function(err) {
        console.log(err);
      }
    });
  });

  $('#logout').click(function (e) {
    e.preventDefault();
    
    Cookies.remove('token');

    window.location.href = "/"
    // write logout logic here
  });

});