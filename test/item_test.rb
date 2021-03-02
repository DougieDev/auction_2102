require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end

  def test_it_has_readable_attributes
    assert_equal @item1.name, 'Chalkware Piggy Bank'
    assert_equal @item2.name, 'Bamboo Picture Frame'
  end
end