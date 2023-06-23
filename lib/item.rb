# frozen_string_literal: true

# Класс Item представляет собой общий товар в инвентаре магазина Gilded Rose.
# Он содержит атрибуты: название, срок годности и качество.
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
