class Studio < ApplicationRecord
  has_many :yogis, dependent: :destroy

  def self.order_by
    Studio.order("created_at desc")
  end

  def yogis_count
    self.yogis.count
  end

# As a visitor
# When I visit the Parents Index Page
# Then I see a link to sort parents by the number of `child_table_name` they have
# When I click on the link
# Im taken back to the Parent Index Page where I see all of the parents in order of their count of `child_table_name` (highest to lowest) And, I see the number of children next to each parent name

  # def self.order_by_yogis_count
  #   Studio.joins(:yogis).group(:id).order('count(yogis.id) desc')
  # end

end

