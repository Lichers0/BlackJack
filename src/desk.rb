class Desk
  attr_reader :desk

  def take_one_card
    @desk.pop
  end

  def create_new_sorted_desk
    new_desk
    shuffle
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
