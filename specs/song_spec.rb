require('minitest/autorun')
require('minitest/rg')
require_relative('../song')


class SongTest < MiniTest::Test

  def setup
    @song1 = Song.new("Piano Man")
  end

  def test_song_has_name
    expected = "Piano Man"
    actual = @song1.name
    assert_equal(expected, actual)
  end

  def test_song_can_play_music
    expected = "I'M PLAYING MUSIC!!"
    actual = @song1.play
    assert_equal(expected, actual)
  end

end
