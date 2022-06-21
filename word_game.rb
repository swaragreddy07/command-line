require 'httparty'
def word_game()
  score = [0]
  while 1
    hint = []
    word = new_word
    hint = hint + synonyms(word,'true')
    combinations_of_the_word(word , 0, word, hint)
    hint = hint + antonyms(word,'true')
    hint = hint + word_def(word,'true')
    hint = hint.shuffle
    game(hint, score, word)
    puts("your current score is:")
    if score[0] < 0
      score[0] = 0
    end
    puts(score[0])
    puts("1:play again")
    puts("2:end game")
    choice = gets.chomp
    choice = choice.to_i
    if choice == 2
      puts("Thanks! for playing")
    break
    end
  end
end

def game(hint, score, word)
  index = -1
  choice = 2
  while index < hint.length()
    if choice == 2
      puts("the following is the hint of the word that you need to guess(could be a definition,antonym,synonym,jumbled letters of the word:")
      index = index + 1
      puts(hint[index])
    end
    puts("please enter your guess")
    guess = gets.chomp
    if guess == word
      puts("congratulations! you have guessed correctly")
      score[0] = score[0] + 10
      return
    else
      choice = incorrect_choice(score)
      if choice == 3
        return
      end
    end
  end
end

def incorrect_choice(score)
  puts("you have entered incorectly")
  score[0] = score[0] - 2
  puts("1:try again")
  puts("2:take a hint")
  puts("3:skip")
  choice = gets.chomp.to_i
  if choice == 2
    score[0] = score[0] - 3
  elsif choice == 3
    score[0] = score[0] - 4
  end
  choice
end

def combinations_of_the_word(str, index, word, hint)
  if index >= 1
    if str != word
      hint.push(str)
    end
  end
  for j in index..str.length() - 1
    temp_str = str.dup
    temp_var = temp_str[index]
    temp_str[index] = temp_str[j]
    temp_str[j] = temp_var
    combinations_of_the_word(temp_str, index+1, word, hint)
  end
end
