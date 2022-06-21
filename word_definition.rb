require 'httparty'
def word_def(str,for_word_game = 'false')
  if str == ""
    word = new_word
    puts("the word is :#{word}")
  else
    word = str
  end
  result = get_def(word)
  check = 0
  begin
  definitions = []
  result.each do |i|
    definitions.push(i['text'])
  end
  rescue => error
    puts error
    check = 1
  end
  if for_word_game == 'true'
    return definitions
  else
    if check == 0
      puts definitions
    else
      puts('sorry! the word does not exist in our database')
    end
  end
end

def get_def(word)
  url = "https://fourtytwowords.herokuapp.com/word/#{word}/definitions?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  result = response.parsed_response
  return result
end