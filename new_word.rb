require 'httparty'

def new_word()
  url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
  response = HTTParty.get(url)
  result = response.parsed_response
  word = result['word']
  return word
end