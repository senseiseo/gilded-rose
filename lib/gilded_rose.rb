# frozen_string_literal: true

require_relative('item')
require_relative('base_item')
require_relative('aged_brie')
require_relative('backstage_passes')
require_relative('sulfuras')
require_relative('conjured')
require_relative('ordinary_item')

# Класс GildedRose отвечает за обновление качества и срока годности товаров в магазине Gilded Rose.
# Он содержит методы для обновления качества различных типов товаров, таких как обычные товары,
# товары Aged Brie, Backstage passes и Sulfuras. Класс также предоставляет метод `update_quality`,
# который обновляет качество всех товаров в списке `items`.
class GildedRose
  attr_reader :items

  def initialize(items)
    @items = items.map { |item| class_definitions(name: item.name).new(item) }
  end

  def update_quality
    @items.each(&:update)

    self
  end

  private

  AGED_BRIE = 'Aged Brie'
  BACKSTAGE_PASSES = 'Backstage passes to a TAFKAL80ETC concert'
  SULFURAS = 'Sulfuras, Hand of Ragnaros'
  CONJURED = 'conjured '
  ITEM_CLASSES = {
    AGED_BRIE => AgedBrie,
    SULFURAS => Sulfuras,
    BACKSTAGE_PASSES => BackstagePasses
  }.freeze
  private_constant :AGED_BRIE, :BACKSTAGE_PASSES, :SULFURAS, :CONJURED, :ITEM_CLASSES

  def class_definitions(name:)
    return Conjured if conjured_item?(name)

    ITEM_CLASSES[name] || OrdinaryItem
  end

  def conjured_item?(name)
    name.downcase.start_with?(CONJURED)
  end
end
