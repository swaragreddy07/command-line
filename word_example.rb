require 'httparty'
def word_example(str)
    if str == ""
      word = new_word
    else
      word = str
    end
    check = 0
    begin
      result = get_example(word)
      array = []
      for i in 0..result.length()-1
        for j in 0..result[i]["examples"].length()-1
          array.push(result[i]["examples"][j]["text"])
        end
      end
    rescue => error
      check = 1
    end
    if check.zero?
      puts(array)
    else
      puts('sorry the word doesnot exist in our database')
    end
end

def get_example(word)
  url  = "https://fourtytwowords.herokuapp.com/word/#{word}/examples?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  result = []
  result.push(response.parsed_response)
  return result 
end