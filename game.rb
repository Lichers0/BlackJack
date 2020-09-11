require_relative 'desk'
require_relative 'base_man'

class Bank
  attr_reader :money

  def initialize
    @money = 0
  end

  def add(bet)
    @money += bet
  end

  def display
    "Банк: #{@bank.money}"
  end
end

class Interface

  def start
    init
    @player.take_two_card
    @dealer.take_two_card
    @bank.add(@player.bet)
    @bank.add(@dealer.bet)

  end

  private

  def display

  end

  def init
    @bank = Bank.new
    @desk = Desk.new
    @dealer = Dealer.new(@desk)
    if @player
      @player = Player.new(@desk, @player.name)
    else
      create_player
    end
  end

  def create_player
    puts "Введите ваше имя"
    name = gets.chomp
    @player = Player.new(@desk, name)
  end
end

t = Interface.new
t.start
p "end"