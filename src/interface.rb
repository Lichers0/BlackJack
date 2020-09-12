class Interface
  def start
    init
    first_deal
    loop do
      display
      player_action
      break if @player.open_cards?

      dealer_action
      break if @player.have_3cards? && @dealer.have_3cards?
    end
    open_cards
    one_more! if @player.money? && @dealer.money?
  rescue StandardError
    retry
  end

  private

  def one_more!
    puts "Еще раздача?"
    puts "1 - Да"
    puts "enter - Нет"
    action = gets.chomp
    raise "new game" if action == "1"
  end

  def first_deal
    @player.take_two_card
    @dealer.take_two_card
    @money.add(@player.bet)
    @money.add(@dealer.bet)
  end

  def player_action
    display_player_action
    action = gets.chomp.to_sym
    @player.send(@action_list[action])
    delete_action
    display unless action == "3".to_sym
  rescue StandardError
    puts "Wrong input"
    retry
  end

  def open_cards
    puts "OPEN CARDS !!!"
    @dealer.show_cards!
    display
    player_score = @player.score
    dealer_score = @dealer.score
    return draw if player_score > 21 && dealer_score > 21
    return draw if player_score == dealer_score
    return dealer_won if player_score > 21

    delta_player_score = 21 - player_score
    delta_dealer_score = 21 - dealer_score
    return dealer_won if delta_dealer_score < delta_player_score

    player_won
  end

  def player_won
    puts "Игрок выиграл"
    @player.take_money(@money.all_money)
  end

  def dealer_won
    puts "Дилер выиграл"
    @dealer.take_money(@money.all_money)
  end

  def draw
    puts "Ничья"
    @player.take_money(@money.half_money)
    @dealer.take_money(@money.all_money)
  end

  def dealer_action
    puts
    puts "Дилер ходит..."
    @dealer.take_one_card if @dealer.score < 17
  end

  def display_player_action
    puts "\nВыберите действие:"
    @display_action_list.each do |index, value|
      puts "#{index} - #{value}."
    end
  end

  def display
    puts @money.information
    puts @dealer.information
    puts @player.information
  end

  def delete_action
    @action_list.delete(:"1")
    @action_list.delete(:"2")
    @display_action_list.delete(:"1")
    @display_action_list.delete(:"2")
  end

  def init
    @action_list = { "1": "skip", "2": "take_one_card", "3": "open_cards" }
    @display_action_list = { "1": "Пропустить ход", "2": "Взять карту", "3": "Открыть Карты" }
    @money ||= Bank.new
    @desk ||= Desk.new
    @desk.create_new_sorted_desk
    @dealer ||= Dealer.new(@desk)
    @dealer.hide_cards!
    @player ||= create_player
    @player.init
  end

  def create_player
    puts "Введите ваше имя"
    name = "D" #gets.chomp
    @player = Player.new(@desk, name)
  end
end
