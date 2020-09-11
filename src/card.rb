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
