class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
    enum making_status: { can_not: 0, waiting: 1, making: 2, completed: 3 }
end
