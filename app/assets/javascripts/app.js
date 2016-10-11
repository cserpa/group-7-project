$(document).ready(function(){
  // setInterval(updateVotes, 500);
});

var updateVotes = function() {
  var ratingElements = $(".rating");
  ratingElements.each(function(index){
    var rating = ratingElements[index];
    var rating_id = rating.getAttribute('id');
    $.ajax({
      url: '/votes/' + rating_id,
      contentType: 'application/json'
    })
    .done(function(total) {
      rating.innerHTML = total;
    })
  })
}
