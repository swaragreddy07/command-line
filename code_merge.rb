require_relative "word_definition.rb"
require_relative "new_word.rb"
require_relative "word_example.rb"
require_relative "synonym.rb"
require_relative "antonym.rb"
require_relative "full_dict.rb"
require_relative "word_game.rb"
puts("1:word defnintion")
puts("2:word examples")
puts("3:word synonyms")
puts("4:word antonyms")
puts("5:full dict")
puts("6:word game")
choice = gets.chomp.to_i
if choice == 1 || choice == 2 || choice == 3 || choice == 4 || choice == 5
  puts("enter a word or get a random word")
  word = gets.chomp
end
if choice == 1
  word_def(word)
elsif choice == 2
  word_example(word)
elsif choice == 3
  synonyms(word)
elsif choice == 4
  antonyms(word)
elsif choice == 5
  full_dict(word)
else
  word_game
end
 

