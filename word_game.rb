require 'httparty'
def word_game()
  while 1
    score = [0]
    array = []
    word = new_word
    array = array + synonyms(word,'true')
    combinations_of_the_word(word,0,word,array)
    array = array + antonyms(word,'true')
    array = array + word_def(word,'true')
    game(array,score,word)
    puts("your current score is:")
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
  return
end

def game(array,score,word)
  index = -1
  choice = 2
  while index<array.length()
    if score[0]<0
      score[0] = 0
    end
    if choice == 2
      puts("the following is the hint of the word that you need to guess(could be a definition,antonym,synonym,jumbled letters of the word:")
      index = index + 1
      puts(array[index])
    end
    puts("please enter your guess")
    guess = gets.chomp
    if guess == word
      puts("congratulations! you have guessed correctly")
      score[0] = score[0]+10
      return
    else
      choice = incorrect_choice(score)
      if choice == 3
        return
      end
    end
  end
  return
end

def incorrect_choice(score)
  puts("you have entered incorectly")
  score[0] = score[0]-2
  puts("1:try again")
  puts("2:take a hint")
  puts("3:skip")
  choice1 = gets.chomp
  choice1 = choice1.to_i
  if choice1 == 2
    score[0] = score[0]-3
  elsif choice1 == 3
    score[0] = score[0]-4
  end
  if score[0]<0
    score[0]=0
  end
  return choice1
end

def combinations_of_the_word(str,index,word,array)
  if index>=1
    if str!=word
      array.push(str)
        return
    end
  end
  for j in index..str.length()-1
    temp_str = str.dup
    temp_var = temp_str[index]
    temp_str[index] = temp_str[j]
    temp_str[j] = temp_var
    combinations_of_the_word(temp_str,index+1,word,array)
  end
end
