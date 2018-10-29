require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')
require_relative('../song')


class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jake", 50, "Uptown Girl")

    @room1 = Room.new("Rock", 1, 10)
    @room2 = Room.new("Jazz", 10, 60)

    @song1 = Song.new("Uptown Girl")
  end

  def test_guest_has_name
    expected = "Jake"
    actual = @guest1.name
    assert_equal(expected, actual)
  end

  def test_guest_has_money
    expected = 50
    actual = @guest1.money
    assert_equal(expected, actual)
  end

  def test_guest_has_favourite_song
    expected = "Uptown Girl"
    actual = @guest1.favourite_song
    assert_equal(expected, actual)
  end

  def test_guest__pay_entry_fee__has_enough_money
    expected = "Jake's balance is now £40."
    actual = @guest1.pay_entry_fee(@room1)
    assert_equal(expected, actual)
  end

  def test_guest_pay_entry_fee__joins_room
    @guest1.pay_entry_fee(@room1)

    expected = @room1
    actual = @guest1.room
    assert_equal(expected, actual)
  end

  def test_cheer_at_song
    expected = "Whoo! This is my jam!"
    actual = @guest1.cheer_at_song
    assert_equal(expected, actual)
  end

  def test_buy_a_drink
    @room1.check_in_guest(@guest1)

    expected = "Jake's balance is now £35"
    actual = @guest1.buy_a_drink(@room1.drinks_available_from_bar[0])
    assert_equal(expected, actual)
  end

  def test_buy_a_drink__room_money_increases
    @room1.check_in_guest(@guest1)
    @guest1.buy_a_drink(@room1.drinks_available_from_bar[0])
    
    expected = 15
    actual = @room1.total_income
    assert_equal(expected, actual)
  end

end
