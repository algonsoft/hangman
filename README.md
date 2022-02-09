# Hangman

**What this is?**

Hangman is a game traditionally played with pen and paper. The goal of hangman is to guess a hidden word letter by letter until the word is revealed. You have a certain number of turns to guess the word (in this implementation 10) and lose a turn for each incorrect guess that you make. If you completely reveal the word before your final turn you win, otherwise you lose.

**Game Setup**
  - Ensure Ruby is installed on your machine.
  - Clone the repository to your local machine with the command: > git clone git@github.com:algonsoft/hangman.git
  - Navigate to the root directory of the project and input: > ruby hangman.rb

**How to Play**
  - At the beginning of program execution you can load a previously saved game.
  - Input a letter to attempt to guess the hidden word.
  - If you input a correct letter, the hidden letters in the word will be revealed and you won't lose a turn.
  - If you input an incorrect letter you will lose a turn.
  - You have 10 turns to fully reveal the hidden word, otherwise you lose.

**Functionality**
  - Ability to play a game of hangman where you are the guesser.
  - The ability to save a game.
  - And the ability to load a previously saved game.

**What I have learned**
  - Improved my understanding of using serilization formats to save and restore data (YAML was used for this project)
  - Improved my understanding of Ruby's I/O class and the functionality of read from and write to a file
