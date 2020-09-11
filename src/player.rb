class Player < BaseMan
  attr_reader :name
  def initialize(desk, name)
    @name = name
    init
    super desk
  end

  def information
    "#{@name}: #{show_cards} (#{score}). Money: #{@money}"
  end

  def open_cards
    @open_cards = true
  end

  def init
    @open_cards = false
  end

  def open_cards?
    @open_cards
  end

  def skip
    puts "Пропуск хода..."
  end
end
