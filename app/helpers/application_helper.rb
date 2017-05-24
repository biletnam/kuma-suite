module ApplicationHelper
  def standard_date_format(date)
    date.strftime('%B %d')
  end

  def flash_class(level)
    case level
    when :success then "ui green message"
    when :error then "ui red message"
    when :notice then "ui blue message"
    end
  end
end
