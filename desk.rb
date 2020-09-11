class Card
  def initialize(rank:, suit:)
    @rank = rank.to_sym
    @suit = suit.to_sym
    @value = { "A": 11, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6,
               "7": 7, "8": 8, "9": 9, T: 10, J: 10, Q: 10, K: 10 }
  end

  def ace?
    @rank == :A
  end

  def low_ace_score
    1
  end

  def score
    @value[@rank]
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end

class Desk
  attr_reader :desk

  def initialize
    new_desk
    shuffle
  end

  def take_one_card
    @desk.pop
  end

  private

  def shuffle
    @desk.shuffle!
  end

  def new_desk
    suits = %w[♠ ♥ ♦ ♣]
    ranks = %w[A 2 3 4 5 6 7 8 9 T J Q K]
    @desk = []
    suits.each do |suit|
      ranks.each do |rank|
        @desk <<= Card.new(rank: rank, suit: suit)
      end
    end
  end
end

# t = Desk.new
# t.new_desk
# t.shuffle
# card = t.take_one_card
# p card.to_s
# p card.ace?
# p card.score


