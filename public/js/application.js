$(document).ready(function() {

  loadIndexPopular();
  eventListeners();

});


var loadIndexPopular = function() {

  $.ajax({
    url: '/media/popular',
    type: 'GET',
    dataType: 'json'
  })
  .done(function(data) {
    console.log("success");
    console.log(data);
    data.forEach(function(object) {

        $('#popular').append('<img src='+object.images.standard_resolution.url+'>')
    });
    $('#popular img').css({'display': 'block', 'margin': '0 auto', 'margin-bottom': '25px'});
  })
  .fail(function() {
    console.log("error");
  })
  .always(function() {
    console.log("complete");
  });

};


var eventListeners = function() {

  $('#media_search').on('click', function(event) {
    event.preventDefault();

    var lat = $('.search').serializeArray()[0].value;
    var lng = $('.search').serializeArray()[1].value;

    if (($('.search').serializeArray()[2].value) !== undefined) {
      var label = $('.search').serializeArray()[2].value;
    };

    $.ajax({
      url: '/media/search',
      type: 'GET',
      dataType: 'json',
      data: {latitude: lat, longitude: lng, name: label}
    })
    .done(function(data) {
      console.log(data);

      data.forEach(function(object) {
        $('#index_search').append('<div><img src='+object.images.standard_resolution.url+'>')

      });
      $('#index_search img').css({'display': 'block', 'margin': '0 auto', 'margin-bottom': '25px'});

      $('.search').reset();
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  });

};

