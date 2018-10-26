require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../room')


class GuestTest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Jake", 50)

    @room1 = Room.new("Rock", 1, 10)
    @room2 = Room.new("Jazz", 10, 60)
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

  def test_guest_can_afford_entry_fee
    expected = true
    actual = @guest1.can_afford_entry_fee(@room1)
    assert_equal(expected, actual)
  end

  def test_guest_can_afford_entry_fee__false
    expected = false
    actual = @guest1.can_afford_entry_fee(@room2)
    assert_equal(expected, actual)
  end

  def test_guest__pay_entry_fee__has_enough_money
    expected = "Jake's balance is now £40."
    actual = @guest1.pay_entry_fee(@room1)
    assert_equal(expected, actual)
  end

  def test_guest_pay_entry_fee__not_enough_money
    expected = "Jake doesn't have enough money to go in the Jazz room!"
    actual = @guest1.pay_entry_fee(@room2)
    assert_equal(expected, actual)
  end
end
