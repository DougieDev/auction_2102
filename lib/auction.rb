

class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    # item_params = {
    #   name: item.name
    # }
    # item = Item.new(item_params)
    @items << item
  end
end