class Guest

  attr_reader :name, :money, :favourite_song, :room

  def initialize(name, money, favourite_song)
    @name = name
    @money = money
    @favourite_song = favourite_song
    @room = nil
  end

  def pay_entry_fee(room)
      @money -= room.entry_fee
      @room = room

      return "#{name}'s balance is now £#{money}."
  end

  def cheer_at_song
      return "Whoo! This is my jam!"
  end

  def buy_a_drink(drink)
    cost_of_drink = drink[:cost]
    @money -= cost_of_drink

    return "Jake's balance is now £#{money}"
  end

end
