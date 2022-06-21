require 'httparty'
def full_dict(str)
  if str == ""
    word = new_word
    puts("the word is :#{word}")
  else
    word = str 
    end
  puts('the definitions of the word are:')
  word_def(word)
  puts('the examples of the word are:')
  word_example(word)
  puts('the synonyms of the word are:')
  synonyms(word)
  antonyms(word)
end
  