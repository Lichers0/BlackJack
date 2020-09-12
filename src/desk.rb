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
    @desk = []
    Card.suits.each do |suit|
      Card.ranks.each do |rank|
        @desk <<= Card.new(rank: rank, suit: suit)
      end
    end
  end
end
