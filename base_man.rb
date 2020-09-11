class BaseMan
  def initialize(desk)
    @bank = 100
    @cards = []
    @desk = desk
  end

  def bet
    @bank -= 10
  end

  def take_two_card
    @cards << @desk.take_one_card
    @cards << @desk.take_one_card
  end

  def calculate
    @result = 0
    @cards.each do |card|
      @result += if @result + card.score <= 21
                   card.score
                 else
                   card.ace? ? card.low_ace_score : card.score
                 end
    end
    @result
  end

  private

  def show_cards
    @cards.map { |card| card.to_s}
  end
end

class Player < BaseMan
  attr_reader :name
  def initialize(desk, name)
    @name = name
    super desk
  end
end

class Dealer < BaseMan
  def initialize(desk)
    super desk
    @hide = true
  end

  def to_s
    puts "Дилер: #{show_cards} (#{calculate})"
  end

  private

  def show_cards
    return super unless @hide

    show_hide_cards
  end

  def show_hide_cards
    @cards.map { |_| "*" }
  end

  public def calculate
    return super unless @hide

    show_hide_calculate
  end

  def show_hide_calculate
    "*"
  end
end