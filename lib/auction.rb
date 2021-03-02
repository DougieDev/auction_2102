

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

  def item_names
    items.map do |item|
      item.name
    end
  end
end