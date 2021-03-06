class Item
  attr_reader :name, :bids

  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(attendee, bid_num)
    bids[attendee] = bid_num
  end

  def current_high_bid
    bids.values.max
  end
end