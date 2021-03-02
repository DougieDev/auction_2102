require 'minitest/autorun'
require 'minitest/pride'
require './lib/auction'

class AuctionTest < Minitest::Test
  def setup
    @auction = Auction.new
  end
end