class Guest

  attr_reader :name, :money, :favourite_song

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
  end

  def pay_entry_fee(room)
    if @money >= room.entry_fee
      @money -= room.entry_fee
      return "#{name}'s balance is now £#{money}."
    else
      return "#{name} doesn't have enough money to go in the #{room.name} room!"
    end
  end

  def cheer_at_song
      p "Whoo! This is my jam!"
  end


end
