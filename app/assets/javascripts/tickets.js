$(document).ready(function() {

  $("#ticket-table").tablesorter();
  $("#order-table").tablesorter();

  function updateTicket(id, ticketParams) {
    $.ajax({
      url: '/tickets/' + id + '.json',
      data: { ticket: ticketParams },
      method: 'PATCH',
      dataType: 'json',
      success: function(response) {
        console.log(response.message)
      },
      error: function(response, status, error) {
        console.log(response.message)
      }
    })
  };

  $('.ticket_row button').on('click', function(event) {
    event.preventDefault()
    let ticket_row = $(this).parents('.ticket_row')
    let ticket_id = ticket_row.data().id
    var ticket_flag = ticket_row.find('.ticket_flag .item.active.selected i').data('flag')
    let ticket_status = ticket_row.find('.ticket_status a.text').text()
    let ticket_rep = ticket_row.find('.ticket_rep a.text').text()

    updateParams = {
      status: ticket_status,
      flag: ticket_flag,
      rep: ticket_rep
    }

    updateTicket(ticket_id, updateParams)
  })

});
