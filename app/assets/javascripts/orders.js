$(document).ready(function() {
  var skuFields = $('.nested-fields')

  skuFields.each(function(index) {
    var self = this

    $(this).find('input').on('change', function(event) {
      event.stopPropagation()
      var unit = $(self).find('.order_skus_unit input').val()
      var amount = $(self).find('.order_skus_amount input').val()
      var total = $(self).find('input.disabled')

      var newSum = parseFloat(unit) * parseFloat(amount)
      console.log(newSum)
      total.val(newSum)
    })
  })

})
