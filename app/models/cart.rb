class Cart < ActiveRecord::Base
  attr_reader :total
  attr_accessor :status

  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    line_items.inject(0) { |sum, line_item| sum += (line_item.quantity * line_item.item.price)  }
  end

  def add_item(item_id)
    line_item = line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item_id)
    end
    line_item
  end

  def checkout
    items.each do |item|
      line_item_quantity = item.line_items.map {|li| li.quantity}.inject(:+)
      item.update(inventory: item.inventory - line_item_quantity)
    end

    self.update(status: 'submitted', submitted: true)    
  end
end
