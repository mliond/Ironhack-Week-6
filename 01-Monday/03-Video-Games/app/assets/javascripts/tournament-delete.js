function deleteTournament (event) {
  event.preventDefault();

  tournamentId = $(this).prop('value');

  var request = $.ajax({
        url: '/api/tournaments/' + tournamentId,
        type: 'DELETE',
  });

  request.done(goBack)

  function goBack () {
    console.log('done')
  }


};