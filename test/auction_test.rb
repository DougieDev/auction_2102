require 'minitest/autorun'
require 'minitest/pride'
require './lib/auction'
require './lib/item'

class AuctionTest < Minitest::Test
  def setup
    @auction = Auction.new
  end

  def test_it_exists
    assert_instance_of Auction, @auction
  end

  def test_it_has_readable_attributes
    assert_equal [], @auction.items
  end

  def test_it_can_add_items
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    @auction.add_item(item1)
    @auction.add_item(item2)
    # require 'pry'; binding.pry
    assert_equal [item1, item2], @auction.items
  end

  def test_it_can_list_item_names
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

    @auction.add_item(item1)
    @auction.add_item(item2)

    assert_equal ['Chalkware Piggy Bank', 'Bamboo Picture Frame'], @auction.item_names
  end
end