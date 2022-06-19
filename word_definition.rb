require 'httparty'
def word_def(str,n)
    n=n.to_i
    if str == ""
      word = new_word
    else
      word = str
    end
    result = get_def(word)
    check = 0
    begin
    array = []
    result.each do |i|
      array.push(i['text'])
    end
    rescue 
      check = 1
    end
    if n == 0
      if check.zero?
        puts(array)
      else
        puts('sorry the word is not available in our database')
      end
    else
      return array
    end
end

def get_def(word)
  url = "https://fourtytwowords.herokuapp.com/word/#{word}/definitions?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  result = response.parsed_response
  return result
end