class Studio < ApplicationRecord
  has_many :yogis

  def self.order_by
    Studio.order("created_at desc")
  end

  def yogis_count
    self.yogis.count
  end

  def order_by_name
    Yogi.order(:name)
  end
end
