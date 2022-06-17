require 'httparty'
def worddef(s)
    if s==""
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is :")
    puts(w)
    else
    w=s
    end
    #puts("infunction")
    url = "https://fourtytwowords.herokuapp.com/word/#{w}/definitions?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    pp=response.parsed_response
    r=0
    begin
    a=[]
    for i in 0..pp.length()-1
        a.push(pp[i]["text"])
    end
    rescue
    r=1
    end
    if r==0
    puts(a)
    else
        puts("sorry the word is not available in our database")
    end
    return
end
def wordexample(s)
    if s==""
    url = "http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is:")
    puts(w)
    else
    w=s
    end
    #puts("swarag reddy #{w}")
    r=0
    begin
    url  = "https://fourtytwowords.herokuapp.com/word/#{w}/examples?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    pp=[]
    pp.push(response.parsed_response)
    a=[]
    for i in 0..pp.length()-1
        for j in 0..pp[i]["examples"].length()-1
            a.push(pp[i]["examples"][j]["text"])
        end
    end
    rescue
        r=1
    end
    if r==0
    puts(a)
    else
        puts("sorry the word doesnot exist in our database")
    end
end
def synonyms(q,s)
    if s==""
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is:")
    puts(w)
    else
    w=s
    end
    begin
    r=0
    url = "https://fourtytwowords.herokuapp.com/word/#{w}/relatedWords?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
    response = HTTParty.get(url)
    p=response.parsed_response
    a=[]
    s=[]
    aa=0
    ss=0
    for i in 0..p.length()-1
        p[i].each do |k,v|
            if v=="synonym"
                aa=0
                ss=1
            elsif v=="antonym"
                aa=1
                ss=0
            elsif aa==1 
                a.push(v)
            elsif ss=1
                s.push(v)
            end

        end
    end    
    rescue
    r=1
    end 
    if r==1
        puts("sorry! the word is not in our database")
    else
    if q=="s" || q=="sa"
        puts("the synonyms of the word are")
        if s.length()==0
            puts("sorry! there are no synonyms for the word in the database")
        else
           puts(s)
        end
    end
    if q=="a" || q=="sa"
        if a.length()==0
            puts("sorry! there are no antonyms for the word in the database")
        else
            puts("the antonyms of the word are")
            puts(a)
        end
    end
end

end
def fulldict(s)
    if s==""
    url = 'http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    response = HTTParty.get(url)
    p=response.parsed_response
    w=p["word"]
    puts("the word is:")
    puts(w)
    else
    w=s 
    end
    puts("the definition of the word is")
    worddef(w)
    puts("the examples of the word are")
    wordexample(w)
    puts("the antonyms and synonyms of the word are")
    synonyms(5,w)
end
