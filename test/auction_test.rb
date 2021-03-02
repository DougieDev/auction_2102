require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/auction'
require './lib/attendee'

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

  # def test_it_can_bid_on_items
  #   item1 = Item.new('Chalkware Piggy Bank')
  #   item2 = Item.new('Bamboo Picture Frame')
  #   item3 = Item.new('Homemade Chocolate Chip Cookies')
  #   item4 = Item.new('2 Days Dogsitting')
  #   item5 = Item.new('Forever Stamps')

  #   attendee1 = Attendee.new(name: 'Megan', budget: '$50')
  #   attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  #   attendee3 = Attendee.new(name: 'Mike', budget: '$100')

  #   @auction.add_item(item1)
  #   @auction.add_item(item2)
  #   @auction.add_item(item3)
  #   @auction.add_item(item4)
  #   @auction.add_item(item5)

  #   @item1.add_bid(@attendee2, 20)
  #   @item1.add_bid(@attendee1, 22)

  #   bid_list = {
  #     @attendee2 => 20,
  #     @attendee1 => 22
  #   }

  #   assert_equal bid_list, @item1.bids
  # end

  def test_it_can_show_unpopular_items
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction.add_item(item1)
    @auction.add_item(item2)
    @auction.add_item(item3)
    @auction.add_item(item4)
    @auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee2, 50)

    result = [item2, item3, item5]

    assert_equal result, @auction.unpopular_items
  end

  def test_potential_revenue
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction.add_item(item1)
    @auction.add_item(item2)
    @auction.add_item(item3)
    @auction.add_item(item4)
    @auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee2, 22)
    item4.add_bid(attendee2, 50)
    item3.add_bid(attendee2, 15)

    assert_equal 87, @auction.potential_revenue
  end

  def test_bidders
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')

    @auction.add_item(item1)
    @auction.add_item(item2)
    @auction.add_item(item3)
    @auction.add_item(item4)
    @auction.add_item(item5)

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    @auction.bidders

    result = ["Bob", "Megan", "Mike"]

    assert_equal result, @auction.bidders
  end
end