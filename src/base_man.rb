class BaseMan
  def initialize(desk)
    @money = 100
    @cards = []
    @desk = desk
  end

  def bet
    @money -= 10
    10
  end

  def take_money(money)
    @money += money
  end

  def take_two_card
    @cards = []
    take_one_card
    take_one_card
  end

  def take_one_card
    @cards << @desk.take_one_card
  end

  def score
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

  def have_3cards?
    @cards.length == 3
  end

  def money?
    !@money.zero?
  end

  private

  def show_cards
    @cards.map(&:to_s)
  end
end
