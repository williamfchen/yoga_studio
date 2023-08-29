class Studio < ApplicationRecord
  has_many :yogis, dependent: :destroy

  def self.order_by
    Studio.order("created_at desc")
  end

  def yogis_count
    self.yogis.count
  end
end
