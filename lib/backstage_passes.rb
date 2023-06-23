# frozen_string_literal: true

require_relative('base_item')

class BackstagePasses < BaseItem
  def update
    take_away_one_day
    if expired?
      item.quality = 0
    elsif item.sell_in < 5
      increase_quality(item, 3)
    elsif item.sell_in < 10
      increase_quality(item, 2)
    else
      increase_quality(item)
    end

    self
  end
end
