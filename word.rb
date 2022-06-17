require 'httparty'
$a=[]
def word_def(s)
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
  url = "https://fourtytwowords.herokuapp.com/word/#{w}/definitions?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201"
  response = HTTParty.get(url)
  pp=response.parsed_response
  r=0
  begin
  a=[]
  for i in 0..pp.length()-1
    a.push(pp[i]["text"])
    $a.push(pp[i]["text"])
    end
  rescue
    r=1
    end
  if $a[0]!=1
    if r==0
      puts(a)
    else
      puts("sorry the word is not available in our database")
    end
  end
  return
end

def word_example(s)
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

def synonyms(q,
             s)
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
        $a.push(v)
      elsif ss=1
       s.push(v)
       $a.push(v)
      end
    end
  end    
  rescue
    r=1
  end 
  if $a[0]!=1
    if r==1
      puts("sorry! the word is not in our database")
    else
      if q=="s" || q=="sa"
        puts("the synonyms of the word are")
      end
      if s.length()==0
        puts("sorry! there are no synonyms for the word in the database")
      else
        puts(s)
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
end

def full_dict(s)
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
  word_def(w)
  puts("the examples of the word are")
  word_example(w)
  puts("the antonyms and synonyms of the word are")
  synonyms("sa",w)
end

def c(s,i,v)
  if i>=1
    if s!=v
      $a.push(s)
      return
    end
  end
  for j in i..s.length()-1
    t=s.dup
    q=t[i]
    t[i]=t[j]
    t[j]=q
    c(t,i+1,v)
  end
end

def word_game()
  score=0
  while 1
    $a.clear()
    $a[0]=1
    u='http://fourtytwowords.herokuapp.com/words/randomWord?api_key=be45adfee7c617ff1b22a4ffccdf2687a8b7f484d1fc0603388c9f5d51879871e6fa92b0cb6fa6915f86e5c59d2c815b45496db11041a065ff6339318c925201'
    r=HTTParty.get(u)
    w=r.parsed_response
    w=w["word"]
    word_def(w)
    synonyms("sa",w)
    c(w,0,w)
    i=0
    q=2
    while i<$a.length()
      if score<0
        score=0
      end
      if q==2
        puts("the following is the hint of the word that you need to guess(could be a definition,antonym,synonym,jumbled letters of the word:")
        i=i+1
        puts($a[i])
      elsif q==3
        break
      end
      puts("please enter your guess")
      r=gets.chomp
      if r==w
        puts("congratulations! you have guessed correctly")
        score=score+10
        break
      else
        puts("you have entered incorectly")
        score=score-2
        puts("1:try again")
        puts("2:take a hint")
        puts("3:skip")
        q=gets.chomp
        q=q.to_i
        if q==2
        score=score-3
        end
        if q==3
        score=score-4
        end
      end
    end
    puts("your current score is:")
    puts(score)
    puts("1:try again")
    puts("2:end game")
    q=gets.chomp
    q=q.to_i
    if q==2
      puts("Thanks! for playing")
      break
    end
  $a.clear()
  $a[0]=0
  end
end

    