# frozen_string_literal: true

# Класс GildedRose отвечает за обновление качества и срока годности товаров в магазине Gilded Rose.
# Он содержит методы для обновления качества различных типов товаров, таких как обычные товары,
# товары Aged Brie, Backstage passes и Sulfuras. Класс также предоставляет метод `update_quality`,
# который обновляет качество всех товаров в списке `items`.
class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_quality
    items.each { |item| update_item(item) }
    self
  end

  private

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  CONJURED = 'Conjured'
  private_constant :AGED_BRIE, :BACKSTAGE_PASSES, :SULFURAS

  def update_item(item)
    item.sell_in -= 1 unless item.name == SULFURAS

    case item.name
    when AGED_BRIE
      update_aged_brie(item)
    when BACKSTAGE_PASSES
      update_backstage_passes(item)
    when SULFURAS
      update_sulfaras
    when /#{Regexp.escape(CONJURED)}/i
      update_conjured(item)
    else
      update_ordinary_item(item)
    end
  end

  def update_aged_brie(item)
    increase_quality(item)
    increase_quality(item) if item.sell_in.negative?
  end

  def update_backstage_passes(item)
    if item.sell_in.negative?
      item.quality = 0
    elsif item.sell_in < 5
      increase_quality(item, 3)
    elsif item.sell_in < 10
      increase_quality(item, 2)
    else
      increase_quality(item)
    end
  end

  def update_sulfaras; end

  def update_conjured(item)
    decrease_quality(item, 2)
    decrease_quality(item, 2) if item.sell_in.negative?
  end

  def update_ordinary_item(item)
    decrease_quality(item)
    decrease_quality(item) if item.sell_in.negative?
  end

  def increase_quality(item, amount = 1)
    item.quality = [item.quality + amount, 50].min
  end

  def decrease_quality(item, amount = 1)
    item.quality = [item.quality - amount, 0].max
  end
end

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
