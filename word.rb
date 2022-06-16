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
def synonyms(q)
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is:")
    puts(w)
    url = "https://fourtytwowords.herokuapp.com/word/#{w}/relatedWords?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    pp=response.parsed_response
    u=pp.to_s
    ss=[]
    aa=[]
    s=0
    a=0
    w1=0
    w=""
    for i in 0..u.length()-1
        if u[i]=="}"
            s=0
            a=0
            w1=0
        end
        if u[i]>="a" && u[i]<="z"
            w=w+u[i]
        else 
            if w!=""
                if w=="antonym"
                    a=1
                    s=0
                elsif w=="synonym"
                    s=1
                    a=0
                end
                if w=="words"
                    w1=1
                end
                if a==1 && w1==1 && w!="words"
                    aa.push(w)
                elsif s==1 && w1==1 &&w!="words"
                    ss.push(w)
                end

            w=""
            end
        end
    end
    if q==2
        puts("the synonyms of the word are")
        if ss.length()==0
            puts("sorry! there are no synonyms for the word in the database")
        else
            print(ss)
            puts()
        end
    end
    if q==3
        if aa.length()==0
            puts("sorry! there are no antonyms for the word in the database")
        else
            puts("the antonyms of the word are")
            print(aa)
            puts()
        end
    end

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
    if q==2
        puts("you will get a random word and its synonyms")
        synonyms(q)
    end
    if q==4
        puts("you will get a word and examples of the word")
        wordexample()
    end
    if q==3
        puts("you will get the antonyms of the word")
        synonyms(q)
    end
    if q==7
        break
    end
end
puts("end")