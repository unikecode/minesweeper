
$(document).on 'keyup', '.mines', (e) ->
  max_mines = parseInt($('.width').val()) * parseInt($('.height').val())
  if parseInt($('.mines').val()) > max_mines
    $('.mines-error').removeClass('hidden')
    $('.submit-btn').attr('disabled', true)
  else
    $('.mines-error').addClass('hidden')
    $('.submit-btn').attr('disabled', false)

$(document).on 'click', '.mines', (e) ->
  if $('.width').val() == ''  || $('.height').val() == ''
    $('.mines').css('pointer-events', 'none')
    $('.mines-disable').removeClass('hidden')

$(document).on 'focusout', '.height', (e) ->
  EnableMinesField()

$(document).on 'focusout', '.width', (e) ->
  EnableMinesField()

EnableMinesField = () ->
  if $('.width').val() != '' && $('.height').val() != ''
    $('.mines').css('pointer-events', 'all')
    $('.mines-disable').addClass('hidden')
