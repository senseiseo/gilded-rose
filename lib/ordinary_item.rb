# frozen_string_literal: true

require_relative('base_item')

class OrdinaryItem < BaseItem
  def update
    take_away_one_day
    decrease_quality(item)
    decrease_quality(item) if expired?

    self
  end
end
