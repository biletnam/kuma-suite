<img src="http://cs4.pikabu.ru/images/big_size_comm/2015-02_1/14231240052247.png" width="150">

# KUMA SUITE
is an all-in-one support interface for SMB to manage tickets, invoices, payments, work orders, staff performance and customer relations.

## KEY FEATURES
Client-side of the site gives access to support pages to submit tickets and speak to company reps to answer their questions. Client invoices are available to make payment with **Stripe**.

Staff-side hosts a handful of features to manage their internal operations and customer relations all within one program.


**Some of the features include**:

### Ticketing
Client submitted tickets are managed though the ticket interface. Ticket status, flags and comments are updated via AJAX requests. Staff will be able to access internal notes and additional information on the ticket/customer. Clients can leave a feedback on the service they received.

### Work Order / Invoicing
Work orders use **AASM** to control states and progressions of a work order to an invoice. Invoices can be paid with an internal payment system from the **Stripe API**. Mailers will be implemented for invoice receipts for the client.

### Dashboard
The staff welcome page once they are logged on. From here, a member can view today's tasks, currently open tickets, or monthly targets.

### Reports
Reports give a detailed analysis of the staff member's overall performance and achievements.

### Admin
Admin options to manage users are made available through **Devise**. User authentication through Devise and **CanCan**.

## About the project
Kuma Suite was built in 2 weeks, with Rails, jQuery, and AJAX. UI styled with SASS and Semantic UI.

**Notable gems used**: Devise, Cancancan, AASM, Cocoon, Avatarly, TableSorter



## CURRENT TODO
<!-- done items are commented out -->
<!-- - redesign everything -->
<!-- - dropdown if rep.is_present -->
<!-- - flags display -->


### Ticketing
<!-- - aasm states for status -->
- ability to close tickets
- change date helper to reflect (15 hours ago) (application_helper )
<!-- - flags (use icons) [urgent, important, no flag (default) ] -->
<!-- - status [blank (default), in progress, delayed, completed (once completed, clears out of queue and sends to completed page)] -->
- internal notes section for staff
<!-- - clients can only use ticketing system to track their tickets -->
- clients can leave reviews on service
- reviews are only available after ticket is closed
- once ticket is closed, cannot post any more replies, unless internal notes
<!-- - flag 'request manager assistance' for ticket -->
- change everything to single line
<!-- - ticket page to complete -->
<!-- - ticket show to complete -->
<!-- - new ticket default to open flag  -->
<!-- - change ticket flags -->
<!-- - change ticket status -->
<!-- - change resources to support/ticket/id instead. -->
- ticket status dropdown

### Work Orders / Invoice
- total of unit * amount = total, total column + tax = invoice total
- finish Stripe API integration
- add payment option for client side
- add invoice and order links for client side

### Users
- work on users model to add more fields
<!-- - pretty up user pages -->
<!-- - users to complete [admin, agents, clients] -->
<!-- - add user types: user roles -->
<!-- - add rolify like method manually -->
<!-- - user type specific pages and rights -->
<!-- - implement full_name method (migration done for table reference) -->
<!-- - implement avatarly, migrated -->

### Dashboard
- implement Dashboard, more placeholders
- task list for dashboard
<!-- - graphs and stuff, need more eye candy -->

### CSS / Design
<!-- - change active highlight color to teal -->
<!-- - add logo to application -->
<!-- - change name -->
<!-- - background color -->
- implement consistent design across app
<!-- - redo design and color -->


## BUGS
<!-- - when submit ticket from client, redirects to /ticket/id which is only for staff -->
<!-- - div.ui.success needs to adjust size -->
<!-- - login/sign up needs adjust size -->

<!-- - everything -->
<!-- - flash/alert outer margin does not apply background color -->
<!-- - tickets/filter posts change second navbar tab border height -->
<!-- - seeds crash when adding profile_pic, something devise model -->
<!-- - might need to add table profile pic to user? -->

## FUTURE FEATURES TO COVER
<!-- - user types -->
- feedback
<!-- - change name -->
<!-- - possibly slack integration for messaging -->
- ajax internal notes aka messaging system
<!-- - implement sorting for tickets -->
<!-- - create a client side controller only for submitting tickets -->
<!-- - 3000/ is landing, has page info -->
<!-- - 3000/support for client side only, submit ticket -->
<!-- - 3000/ticket for staff managing tickets submitted from support -->


- flags (use icons) [urgent warning, important flag, no flag (default) ]
- status [blank (default), in progress, delayed, completed (once completed, clears out of queue and sends to completed page)]


## Screenshots
![front](https://raw.githubusercontent.com/nTamura/kuma-suite/master/public/screen/front.png)
![dash](https://raw.githubusercontent.com/nTamura/kuma-suite/master/public/screen/dash.png)
![tickets](https://raw.githubusercontent.com/nTamura/kuma-suite/master/public/screen/tickets.png)
![report](https://raw.githubusercontent.com/nTamura/kuma-suite/master/public/screen/report.png)

<!-- flags
```
<i class='red warning sign icon'></i>
<i class='yellow flag icon'></i>
```
status
```
<div class="ui white label">Open</div>
<div class="ui yellow label">In progress</div>
<div class="ui red label">Delayed</div>
<div class="ui grey label">Completed</div>
``` -->

<!--

tickets_controller
  before_action :find_ticket
  tried to add :index to it - crashed
  tried to remove only: [etc] and crashed on
  def find_ticket

ticket/index
  needs work on logic for listing status
  need to attach flag to an ID?
  or switch to flag true or false

 -->
