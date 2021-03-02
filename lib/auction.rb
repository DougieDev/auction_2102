

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

  def unpopular_items
    result = []
    @items.each do |item|
      result << item if item.bids.empty?
    end
    result
  end

  def potential_revenue
    result = @items.map do |item|
      item.bids.values
    end
    high_result = result.map do |arg|
      arg.max
    end.compact.sum
  end

  def bidders
    bidders = []
    @items.each do |item|
      item.bids.keys.each do |bidder|
        bidders << bidder.name
      end
    end
    bidders.uniq
  end
end