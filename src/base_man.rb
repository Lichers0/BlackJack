class BaseMan
  def initialize(desk)
    @money = 100
    @hand = Hand.new
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
    @hand.clear
    take_one_card
    take_one_card
  end

  def take_one_card
    @hand.add(@desk.take_one_card)
  end

  def score
    @hand.score
  end

  def have_3cards?
    @hand.have_3cards?
  end

  def money?
    !@money.zero?
  end

  private

  def show_cards
    @hand.show_cards
  end
end
