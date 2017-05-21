// this file does not work, moved all jquery to ticket index scripts. 

// $(document).ready(function() {
//
//   $("#ticket-table").tablesorter();
//
//   function updateTicket(id, ticketParams) {
//     $.ajax({
//       url: '/tickets/' + id + '.json',
//       data: { ticket: ticketParams },
//       method: 'PATCH',
//       dataType: 'json',
//       success: function(response) {
//         console.log(response.message)
//       },
//       error: function(response, status, error) {
//         console.log(response.message)
//       }
//     })
//   };
//
//   $('.ticket_row button').on('click', function(event) {
//     console.log('wtf hellooo')
//     event.preventDefault()
//
//     var ticket_row = $(this).parents('.ticket_row')
//
//     var ticket_id = ticket_row.data().id
//     // var ticket_flag = ticket_row.find('.ticket_flag a.text').text()
//     var ticket_status = ticket_row.find('.ticket_status a.text').text()
//     var ticket_rep = ticket_row.find('.ticket_rep a.text').text()
//
//     updateParams = {
//       status: ticket_status,
//       rep: ticket_rep
//     }
//
//     updateTicket(ticket_id, updateParams)
//   })
//
// });
