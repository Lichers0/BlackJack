class Desk
  attr_reader :desk

  def shuffle
    @desk.shuffle!
  end

  def new_desk

    suits = %w[♠ ♥ ♦ ♣]
    ranks = %w[A 2 3 4 5 6 7 8 9 T J Q K]
    @desk = []
    suits.each do |suit|
      ranks.each do |rank|
        @desk <<= "#{rank}#{suit}"
      end
    end
  end
end


p test = { "A": 11, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, T: 10, J: 10, Q: 10, K: 10 }
