# A class for managing  a game of hangman.
class Hangman
  def initialize
    @file = File.open('google-10000-english-no-swears.txt', 'r')
    @words = []
    @secret_word = 'test'
    @guess_word = '____'
    @letter = ''
    @move = 0
    @game_won = 0
  end

  def move
    @move
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
    puts @secret_word
    puts @secret_word.length
  end

  def concat_underscores
    until @guess_word.length == @secret_word.length
      @guess_word.concat('_')
    end
  end

  def obtain_user_input
    puts "Please input a letter to guess the secret word!"
    puts "#{@guess_word}"
    @letter = gets.chomp.downcase
    until @letter.length == 1 && @letter =~ /[A-Za-z]/

      puts "Invalid Input!"
      obtain_user_input
    end
  end

  def evaluate_input
    x = 0
    until x == @secret_word.length
      puts @letter
      if @letter == @secret_word[x]
        @guess_word[x] = @secret_word[x]
      end
      x += 1
  end
end

def check_victory
  return unless @guess_word == @secret_word
  @game_won = 1
  puts "You have guessed the secret word with #{10-@move} turns remaining"
end

def game_won
  @game_won
end
end

game = Hangman.new
game.generate_array
game.generate_secret_word
game.concat_underscores

while game.move < 10 || game
  game.obtain_user_input
  game.evaluate_input
  game.check_victory
  if game.game_won == 1
    return
  end
end
