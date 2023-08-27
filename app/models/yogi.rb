class Yogi < ApplicationRecord
  belongs_to :studio

  scope :members, -> { where(member: true) }
end
