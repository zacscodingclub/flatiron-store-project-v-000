class Cart < ActiveRecord::Base
  attr_reader :total

  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject(0) { |sum, line_item| sum += (line_item.quantity * line_item.item.price)  }
  end

  def add_item(item_id)
    line_items.find_or_initialize_by(item_id: item_id)
  end
end
