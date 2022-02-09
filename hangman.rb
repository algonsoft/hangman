require 'yaml'
require 'json'
require 'msgpack'

# A class for managing  a game of hangman.
class Hangman
  attr_reader :move, :game_won

  def initialize
    @file = File.open('google-10000-english-no-swears.txt', 'r')
    @words = []
    @secret_word = 'test'
    @guess_word = '____'
    @letter = ''
    @move = 0
    @game_won = 0
    @saved_game = ''
    @save = ''
  end

  

  def generate_array
    x = 0
    until @file.eof?
      @words[x] = @file.readline
      x += 1
    end
  end

  def generate_secret_word
    until @secret_word.length >= 5 && @secret_word.length <= 12
      @secret_word = @words.sample.chomp
    end
  end

  def concat_underscores
    until @guess_word.length == @secret_word.length
      @guess_word.concat('_')
    end
  end

  def obtain_user_input
    puts 'Please input a letter to guess the secret word!'
    puts @guess_word
    @letter = gets.chomp.downcase
    until @letter.length == 1 && @letter =~ /[A-Za-z]/

      puts 'Invalid Input!'
      obtain_user_input
    end
  end

  def evaluate_input
    x = 0
    until x == @secret_word.length
      if @letter == @secret_word[x]
        @guess_word[x] = @secret_word[x]
        flag = 1
      end
      x += 1
    end
      if flag == 1
        return
      else
        @move += 1
    end
    if @move < 11
    puts "It is now move #{@move} / 10"
    end
  end

def check_victory
  return unless @guess_word == @secret_word
  @game_won = 1
  puts "You have guessed the secret word with #{10-@move} turns remaining"
end

  def ask_to_save
    puts "Enter 'save' if you want to save your game."
    save = gets.chomp.downcase
    return unless save == 'save'

    save_game
  end

def save_game
  data = YAML.dump({ :secret_word => @secret_word,
                     :move => @move,
                     :guess_word => @guess_word })
  File.open("saved_game.yml", "w")
  File.write("saved_game.yml", data)
end

  def ask_to_load
    puts "Do you want to load your previously saved game? 'Y or dismissed."
    answer = gets.chomp.upcase
    return unless answer == 'Y'

    load_game
  end

  def load_game
    data = YAML.load_file('saved_game.yml')
    @secret_word = data[:secret_word]
    @move = data[:move]
    @guess_word = data[:guess_word]
end
end

game = Hangman.new
game.generate_array
game.generate_secret_word
game.concat_underscores
game.ask_to_load
while game.move <= 10
  game.ask_to_save
  game.obtain_user_input
  game.evaluate_input
  game.check_victory
  if game.game_won == 1
    return
  end
end
