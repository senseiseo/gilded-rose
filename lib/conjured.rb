# frozen_string_literal: true

require_relative('base_item')

class Conjured < BaseItem
  def update
    take_away_one_day
    decrease_quality(item, 2)
    decrease_quality(item, 2) if expired?

    self
  end
end
