class Desk
  attr_reader :desk

  def shuffle
    @desk.shuffle!
  end

  def new_desk
    suits = %w[♠ ♥ ♦ ♣]
    ranks = %w[A 2 3 4 5 6 7 8 9 J Q K]
    @desk = []
    suits.each do |suit|
      ranks.each do |rank|
        @desk <<= "#{rank}#{suit}"
      end
    end
  end
end

t = Desk.new
t.new_desk
t.shuffle
p t.desk.length
p t