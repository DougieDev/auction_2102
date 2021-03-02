require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/auction'
require './lib/attendee'

class ItemTest < Minitest::Test
  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction = Auction.new
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_readable_attributes
    assert_equal 'Chalkware Piggy Bank', @item1.name
    assert_equal 'Bamboo Picture Frame', @item2.name
  end

  def test_it_starts_with_no_bids
    empty_hash = {}
    assert_equal empty_hash, @item1.bids
  end

  def test_it_can_bid_on_items
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    bid_list = {
      @attendee2 => 20,
      @attendee1 => 22
    }

    assert_equal bid_list, @item1.bids
  end

  def test_current_high_bid
    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)

    bid_list = {
      @attendee2 => 20,
      @attendee1 => 22
    }

    assert_equal 22, @item1.current_high_bid
  end
end