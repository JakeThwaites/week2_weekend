require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../song')
require_relative('../guest')


class RoomTest < MiniTest::Test

  def setup
    @song1 = Song.new("Piano Man")
    @song2 = Song.new("Song 2")
    songs = [@song1, @song2]

    @guest1 = Guest.new("Jake", 50)

    @room1 = Room.new("Rock", 1, 10)
  end

  def test_room_has_name
    expected = "Rock"
    actual = @room1.name
    assert_equal(expected, actual)
  end

  def test_room_has_max_capacity
    expected = 1
    actual = @room1.max_capacity
    assert_equal(expected, actual)
  end

  def test_room_starts_with_no_songs
    expected = 0
    actual = @room1.songs_in_room.length
    assert_equal(expected, actual)
  end

  def test_room_starts_with_no_guests
    expected = 0
    actual = @room1.guests.length
    assert_equal(expected, actual)
  end


  # def test_play_song
  #   expected = "I'M PLAYING MUSIC!!"
  #   actual = @room1.play_song("Piano Man")
  #   assert_equal(expected, actual)
  # end

  def test_song_added_to_room
    expected = "Piano Man added to room!"
    actual = @room1.add_song_to_room(@song1)
    assert_equal(expected, actual)
  end

  def test_check_guest_into_room
    expected = "Jake's balance is now £40."
    actual = @room1.check_in_guest(@guest1)
    assert_equal(expected, actual)
  end

  def test_check_guest_into_room__max_capacity_exceeded
    @room1.check_in_guest(@guest1)
    expected = "The room is currently at max capacity."
    actual = @room1.check_in_guest(@guest2)
    assert_equal(expected, actual)
  end

  def test_check_out_guest
    @room1.check_in_guest(@guest1)
    expected = "current guests are: []"
    actual = @room1.check_out_guest(@guest1)
    assert_equal(expected, actual)
  end



end
