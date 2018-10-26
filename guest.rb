class Guest

  attr_reader :name, :money

  def initialize(name, money)
    @name = name
    @money = money
  end

  def pay_entry_fee(room)
    if @money >= room.entry_fee
      @money -= room.entry_fee
      return "#{name}'s balance is now £#{money}."
    else
      return "#{name} doesn't have enough money to go in the #{room.name} room!"
    end
  end

end
