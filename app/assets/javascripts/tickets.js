$(document).ready(function() {
//     $('#ticket-table').DataTable();
// this breaks the site.

$("#ticket-table").tablesorter();

} );

$(document).ready(function() {
  function updateTicket(id, ticketParams) {
    $.ajax({
      url: '/tickets/' + id,
      data: { ticket: ticketParams },
      method: 'PATCH',
      success: function(response) {
        console.log(response.responseText)
      },
      error: function(response) {
        console.log(response.responseText)
      }
    })
  }

  $('.ticket_row button').on('click', function(event) {
    var ticket_row = $(this).parents('.ticket_row')

    var ticket_id = ticket_row.data().id
    // var ticket_flag = ticket_row.find('.ticket_flag a.text').text()
    var ticket_status = ticket_row.find('.ticket_status a.text').text()
    var ticket_rep = ticket_row.find('.ticket_rep a.text').text()

    updateParams = {
      status: ticket_status,
      rep: ticket_rep
    }

    updateTicket(ticket_id, updateParams)
  })
})
