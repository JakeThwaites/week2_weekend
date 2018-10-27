class Room

  attr_reader :name, :max_capacity, :songs_in_room, :guests, :entry_fee, :song_playing

  def initialize(name, max_capacity, entry_fee)
    @name = name
    @max_capacity = max_capacity
    @songs_in_room = []
    @song_playing = @songs_in_room.sample
    @guests = []
    @entry_fee = entry_fee
    # @total_income = 0
  end

  def add_song_to_room(song)
      @songs_in_room << song
      return "#{song.name} added to room!"
  end

  def check_in_guest(guest)
    if @guests.length >= @max_capacity
      return "The room is currently at max capacity."
    else
      if guest.money >= @entry_fee
        @guests << guest
        guest.pay_entry_fee(self)
      else
        return "#{guest.name} doesn't have enough money to enter!"
      end
    end
  end

  def check_out_guest(guest)
    @guests.delete(guest)
    return "current guests are: #{@guests}"
  end

  def start_the_music

    @song_playing = @songs_in_room.sample
     @song_playing.play
  end


end
