module ApplicationHelper
  def standard_date_format(date)
    date.strftime('%B %d')
  end
end
