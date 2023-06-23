# frozen_string_literal: true

class BaseItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def increase_quality(item, amount = 1)
    item.quality = [item.quality + amount, 50].min
  end

  def decrease_quality(item, amount = 1)
    item.quality = [item.quality - amount, 0].max
  end

  def take_away_one_day
    item.sell_in -= 1
  end

  def expired?
    item.sell_in.negative?
  end
end
