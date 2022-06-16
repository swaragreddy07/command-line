require 'httparty'
def worddef()
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is :")
    puts(w)
    #puts("infunction")
    url = "https://fourtytwowords.herokuapp.com/word/#{w}/definitions?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    pp=response.parsed_response
    puts(pp)
    return
end
def wordexample()
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is:")
    puts(w)
    #puts("swarag reddy #{w}")
    url = "https://fourtytwowords.herokuapp.com/word/#{w}/examples?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    pp=response.parsed_response
    puts(pp)
    return 
end

while 1
    
    puts("1:Word definition")
    puts("2:word synonyms")
    puts("3:word antonyms")
    puts("4:word examples")
    puts("5:word full dict")
    puts("6:word game")
    puts("7:exit")
    q=gets.to_i
    if q==1
        puts("you will get a rondom word and its definition")
        worddef()
    end
    if q==4
        puts("you will get a word and examples of the word")
        wordexample()
    end
    if q==7
        break
    end
end
puts("end")