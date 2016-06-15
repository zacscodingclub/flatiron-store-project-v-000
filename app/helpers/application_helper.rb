module ApplicationHelper

  def to_dollars(num)
    number_to_currency(num.to_f / 100)
  end

  def current_cart
    current_user.current_cart
  end
end
