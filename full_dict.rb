require 'httparty'
def full_dict(str)
  if str == ""
    word = new_word
  else
    word = str 
    end
  puts('the definitions of the word are:')
  word_def(word,'false')
  puts('the examples of the word are:')
  word_example(word)
  puts('the synonyms of the word are:')
  synonyms(word,'false')
  puts('the antonyms of the word are:')
  antonyms(word,'false')
end
  