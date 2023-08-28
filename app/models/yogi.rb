class Yogi < ApplicationRecord
  belongs_to :studio

  scope :members, -> { where(member: true) }

  scope :order_by_name, -> { order(:name) }
end
