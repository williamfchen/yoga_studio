class Studio < ApplicationRecord
  has_many :yogis

  def self.order_by
    Studio.order("created_at DESC")
  end

  def yogis_count
    self.yogis.count
  end
end
