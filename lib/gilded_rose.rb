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

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASSES = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"

  private_constant :AGED_BRIE, :BACKSTAGE_PASSES, :SULFURAS

  def def update_item(item)
    case item.name
    when AGED_BRIE
      update_aged_brie(item)
    when BACKSTAGE_PASSES
      update_backstage_passes(item)
    when SULFURAS
      update_sulfuras(item)
    else
      update_ordinary_item(item)
    end

    item.sell_in -= 1 unless item.name == SULFURAS
    update_expired_item(item) if item.sell_in < 0
  end

  def update_aged_brie(item)
    increase_quality(item)
    increase_quality(item) if item.sell_in < 0
  end

  def update_backstage_passes(item)
    if item.sell_in < 0
      item.quality = 0
    elsif item.sell_in < 6
      increase_quality(item, 3)
    elsif item.sell_in < 11
      increase_quality(item, 2)
    else
      increase_quality(item)
    end
  end

  def update_sulfuras(item)
   
  end

  def update_ordinary_item(item)
    decrease_quality(item)
    decrease_quality(item) if item.sell_in < 0
  end

  def update_expired_item(item)
    case item.name
    when AGED_BRIE
      increase_quality(item)
    when BACKSTAGE_PASSES
      item.quality = 0
    else
      decrease_quality(item)
      decrease_quality(item) if item.sell_in < 0
    end
  end

  def increase_quality(item, amount = 1)
    item.quality = [item.quality + amount, 50].min
  end

  def decrease_quality(item, amount = 1)
    item.quality = [item.quality - amount, 0].max
  end

  # def update_item(item)
  #   if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #     if item.quality > 0
  #       if item.name != "Sulfuras, Hand of Ragnaros"
  #         item.quality = item.quality - 1
  #       end
  #     end
  #   else
  #     if item.quality < 50
  #       item.quality = item.quality + 1
  #       if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #         if item.sell_in < 11
  #           if item.quality < 50
  #             item.quality = item.quality + 1
  #           end
  #         end
  #         if item.sell_in < 6
  #           if item.quality < 50
  #             item.quality = item.quality + 1
  #           end
  #         end
  #       end
  #     end
  #   end
  #   if item.name != "Sulfuras, Hand of Ragnaros"
  #     item.sell_in = item.sell_in - 1
  #   end
  #   if item.sell_in < 0
  #     if item.name != "Aged Brie"
  #       if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #         if item.quality > 0
  #           if item.name != "Sulfuras, Hand of Ragnaros"
  #             item.quality = item.quality - 1
  #           end
  #         end
  #       else
  #         item.quality = item.quality - item.quality
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #       end
  #     end
  #   end
  # end
end

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
