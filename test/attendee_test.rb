require 'minitest/autorun'
require 'minitest/pride'
require './lib/attendee'

class AttendeeTest < Minitest::Test
  def setup
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
  end
end