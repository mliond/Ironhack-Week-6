// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function main () {
  var isJoining = false

  $('[data-hook~=join-bbq]').on('click', function (event) {
    if (isJoining) {
      return
    }

    isJoining = true
    var $button = $(event.target)
    var bbqId = $button.closest('[data-bbq]').data('bbq')

    var request = $.post('/api/barbecues/' + bbqId + '/join')

    request.fail(function () {
      alert('Couldn’t join the barbecue. Try again later.')
      isJoining = false
    })

    request.done(function () {
      $button.fadeOut()
      isJoining = false
      location.reload();
    })
  })

  if ($('[data-hook~=controller-barbecues][data-hook~=action-show]').length) {
    var $bbqContainer = $('[data-hook=bbq-info]')
    var bbqId = $bbqContainer.data('bbq')
    var request = $.get('/api/barbecues/' + bbqId)

    request.fail(function () {
      var htmlParts = [
        '<div class="alert alert-danger" role="alert">',
        '  There was a problem retrieving the BBQ info. Try again later.',
        '</div>'
      ]
      $bbqContainer.append(htmlParts.join('\n'))
    })

    request.done(function (bbq) {
      var bbqMoment = moment(bbq.barbecue.date)
      var htmlParts = [
        '<h2>' + bbq.barbecue.title + '</h2>',
        '<dl>',
        '  <dt>Date:</dt>',
        '  <dd>' + bbqMoment.format('MMMM, D YYYY [at] h:mm a') + '</dd>',
        '  <dt>Venue:</dt>',
        '  <dd>' + bbq.barbecue.venue + '</dd>',
        '<dt>Items:</dt>']

        bbq.items.forEach(function(i) { htmlParts.push('<dd>' + i.name + '</dd>')});
        htmlParts.push('<dt>Attendants:</dt>');
        bbq.users.forEach(function(i) { htmlParts.push('<dd>' + i.email + '</dd>')});
        htmlParts.push('</dl>');

      $bbqContainer.append(htmlParts.join('\n'))
    })
  }

  $('form.new-item').on('submit', function(event) {
    var input = $('input.new-item').val();
    var $bbqContainer = $('[data-hook=bbq-info]');
    var bbqId = $bbqContainer.data('bbq');
    var request = $.post('/api/barbecues/' + bbqId + '/addItem/' + input);

    request.done(function() {
      $('input.new-item').val('');
      location.reload();
    })
  })
})()
