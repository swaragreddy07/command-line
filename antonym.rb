require 'httparty'
def antonyms(str,for_word_game)
  if str == ""
    word = new_word
  else
    word = str 
  end
  begin
  check = 0
  result = get_antonyms(word)
  array = []
  start = 0
  for i in 0..result.length()-1
    result[i].each do |key,value|
      if value == "synonym"
        break
      end 
      if value == "antonym"
        start = 1
      elsif start == 1 
        array.push(value)
      end
    end
  end    
  rescue
    check = 1
  end 
  if for_word_game == 'true'
    return array
  else
    result(array,check)
  end
end

def result(array,check)
  if check == 1 || array.length() == 0
    puts('the antonyms of the word does not exist in our database')
  else
    puts('the antonyms of the word are:')
    puts(array)
  end
  return
end

def get_antonyms(word)
  url = "https://fourtytwowords.herokuapp.com/word/#{word}/relatedWords?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  result=response.parsed_response
  return result
end