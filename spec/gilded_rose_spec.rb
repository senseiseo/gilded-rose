# frozen_string_literal: true

require_relative '../lib/gilded_rose'
require 'pry'

describe GildedRose do
  describe '#update_quality' do
    context 'when checking the item Aged Brie' do
      it 'returns the updated items' do
        names = ['Aged Brie']
        sell_ins = [-1, 0, 1, 12]
        qualities = [-1, 0, 1, 50, 51]
        items = names.product(sell_ins, qualities).map do |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        end
        item_data = [
          [-2, 1], [-2, 2], [-2, 3], [-2, 50],
          [-2, 50], [-1, 1], [-1, 2], [-1, 3],
          [-1, 50], [-1, 50], [0, 0], [0, 1],
          [0, 2], [0, 50], [0, 50], [11, 0],
          [11, 1], [11, 2], [11, 50], [11, 50]
        ]
        item_name = names.first
        expect_result = item_data.map do |data|
          Item.new(item_name, data[0], data[1])
        end

        result = GildedRose.new(items).update_quality

        expect(result.items.map(&:item).map(&:name)).to match_array(expect_result.map(&:name))
        expect(result.items.map(&:item).map(&:sell_in)).to match_array(expect_result.map(&:sell_in))
        expect(result.items.map(&:item).map(&:quality)).to match_array(expect_result.map(&:quality))
      end
    end

    context 'when checking the item Backstage passes to a TAFKAL80ETC concert' do
      it 'returns the updated items' do
        names = ['Backstage passes to a TAFKAL80ETC concert']
        sell_ins = [-1, 0, 1, 4, 9, 12]
        qualities = [-1, 0, 50, 51]
        items = names.product(sell_ins, qualities).map do |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        end
        item_data = [
          [-2, 0], [-2, 0], [-2, 0], [-2, 0],
          [-1, 0], [-1, 0], [-1, 0], [-1, 0],
          [0, 2], [0, 3], [0, 50], [0, 50],
          [3, 2], [3, 3], [3, 50], [3, 50],
          [8, 1], [8, 2], [8, 50], [8, 50],
          [11, 0], [11, 1], [11, 50], [11, 50]
        ]
        item_name = names.first
        expect_result = item_data.map do |data|
          Item.new(item_name, data[0], data[1])
        end

        result = GildedRose.new(items).update_quality

        expect(result.items.map(&:item).map(&:name)).to match_array(expect_result.map(&:name))
        expect(result.items.map(&:item).map(&:sell_in)).to match_array(expect_result.map(&:sell_in))
        expect(result.items.map(&:item).map(&:quality)).to match_array(expect_result.map(&:quality))
      end
    end

    context 'when checking the item Sulfuras, Hand of Ragnaros' do
      it 'returns the updated items' do
        names = ['Sulfuras, Hand of Ragnaros']
        sell_ins = [-1, 0, 1]
        qualities = [-1, 0, 50, 51]
        items = names.product(sell_ins, qualities).map do |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        end
        item_data = [
          [-1, -1], [-1, 0], [-1, 50], [-1, 51],
          [0, -1], [0, 0], [0, 50], [0, 51],
          [1, -1], [1, 0], [1, 50], [1, 51]
        ]
        item_name = names.first
        expect_result = item_data.map do |data|
          Item.new(item_name, data[0], data[1])
        end

        result = GildedRose.new(items).update_quality

        expect(result.items.map(&:item).map(&:name)).to match_array(expect_result.map(&:name))
        expect(result.items.map(&:item).map(&:sell_in)).to match_array(expect_result.map(&:sell_in))
        expect(result.items.map(&:item).map(&:quality)).to match_array(expect_result.map(&:quality))
      end
    end

    context 'when checking the item Conjured Mana Cake' do
      it 'returns the updated items' do
        names = ['Conjured Mana Cake']
        sell_ins = [-1, 0, 1]
        qualities = [-1, 0, 50, 51]
        items = names.product(sell_ins, qualities).map do |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        end
        item_data = [
          [-2, 0], [-2, 0], [-2, 46], [-2, 47],
          [-1, 0], [-1, 0], [-1, 46], [-1, 47],
          [0, 0], [0, 0], [0, 48], [0, 49]
        ]
        item_name = names.first
        expect_result = item_data.map do |data|
          Item.new(item_name, data[0], data[1])
        end

        result = GildedRose.new(items).update_quality

        expect(result.items.map(&:item).map(&:name)).to match_array(expect_result.map(&:name))
        expect(result.items.map(&:item).map(&:sell_in)).to match_array(expect_result.map(&:sell_in))
        expect(result.items.map(&:item).map(&:quality)).to match_array(expect_result.map(&:quality))
      end
    end

    context 'when checking the item ordinary item' do
      it 'returns the updated items' do
        names = ['Something']
        sell_ins = [-1, 0, 1, 4, 9, 12]
        qualities = [-1, 0, 50, 51]
        items = names.product(sell_ins, qualities).map do |name, sell_in, quality|
          Item.new(name, sell_in, quality)
        end
        item_data = [
          [-2, 0], [-2, 0], [-2, 48], [-2, 49],
          [-1, 0], [-1, 0], [-1, 48], [-1, 49],
          [0, 0], [0, 0], [0, 49], [0, 50],
          [3, 0], [3, 0], [3, 49], [3, 50],
          [8, 0], [8, 0], [8, 49], [8, 50],
          [11, 0], [11, 0], [11, 49], [11, 50]
        ]
        item_name = names.first
        expect_result = item_data.map do |data|
          Item.new(item_name, data[0], data[1])
        end

        result = GildedRose.new(items).update_quality

        expect(result.items.map(&:item).map(&:name)).to match_array(expect_result.map(&:name))
        expect(result.items.map(&:item).map(&:sell_in)).to match_array(expect_result.map(&:sell_in))
        expect(result.items.map(&:item).map(&:quality)).to match_array(expect_result.map(&:quality))
      end
    end
  end
end
