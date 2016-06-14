module ApplicationHelper

  def to_dollars(num)
    number_to_currency(num.to_f / 100)
  end
end
