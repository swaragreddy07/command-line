require 'httparty'
def antonyms(str, for_word_game = 'false')
  if str == ""
    word = new_word
    puts("the word is :#{word}")
  else
    word = str 
  end
  begin
    if_word_exist = true
    result = get_antonyms(word)
    antonym = []
    start = 0
    for i in 0..result.length()-1
      result[i].each do |key, value|
        if value == "synonym"
          break
        end 
        if value == "antonym"
          start = 1
        elsif start == 1 
          value.each do |i|
            antonym.push(i)
          end
        end
     end
  end    
  rescue
    if_word_exist = false
  end 
  if for_word_game == 'true'
    return antonym
  else
    result(antonym, if_word_exist)
  end
end

def result(antonym, if_word_exist)
  if if_word_exist == false || antonym.length() == 0
    puts('the antonyms of the word does not exist in our database')
  else
    puts('the antonyms of the word are:')
    puts(antonym)
  end
  return
end

def get_antonyms(word)
  url = "https://fourtytwowords.herokuapp.com/word/#{word}/relatedWords?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  return result=response.parsed_response
end