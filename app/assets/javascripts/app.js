$(document).ready(function(){
  setInterval(updateVotes, 500);
});

let updateVotes = function() {
  let ratingElements = $(".rating");
  ratingElements.each(function(index){
    let rating = ratingElements[index];
    let rating_id = rating.getAttribute('id');
    $.ajax({
      url: '/votes/' + rating_id,
      contentType: 'application/json'
    })
    .done(total => {
      rating.innerHTML = total;
    })
  })
}
