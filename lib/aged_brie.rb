# frozen_string_literal: true

require_relative('base_item')

class AgedBrie < BaseItem
  def update
    take_away_one_day
    increase_quality(item)
    increase_quality(item) if expired?

    self
  end
end
