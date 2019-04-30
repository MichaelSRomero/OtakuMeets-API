require_relative '../lib/scraper.rb'
##################################################
#_________________PERSONALITIES__________________#
##################################################
personalities_array = [
  {title: 'ISTJ'}, {title: 'ISFJ'},
  {title: 'ISTP'}, {title: 'ISFP'},
  {title: 'INTJ'}, {title: 'INFJ'},
  {title: 'INTP'}, {title: 'INFP'},
  {title: 'ESTJ'}, {title: 'ESFJ'},
  {title: 'ESTP'}, {title: 'ESFP'},
  {title: 'ENTJ'}, {title: 'ENFJ'},
  {title: 'ENTP'}, {title: 'ENFP'},
]

personalities_array.each do |personality|
  Personality.create(personality)
  puts "Created #{personality[:title]}"
end

# IS Personality
personality_ISTJ = Personality.find_by(title: 'ISTJ')
personality_ISFJ = Personality.find_by(title: 'ISFJ')
personality_ISTP = Personality.find_by(title: 'ISTP')
personality_ISFP = Personality.find_by(title: 'ISFP')
# IN Personality
personality_INTJ = Personality.find_by(title: 'INTJ')
personality_INFJ = Personality.find_by(title: 'INFJ')
personality_INTP = Personality.find_by(title: 'INTP')
personality_INFP = Personality.find_by(title: 'INFP')
# ES Personality
personality_ESTJ = Personality.find_by(title: 'ESTJ')
personality_ESFJ = Personality.find_by(title: 'ESFJ')
personality_ESTP = Personality.find_by(title: 'ESTP')
personality_ESFP = Personality.find_by(title: 'ESFP')
# EN Personality
personality_ENTJ = Personality.find_by(title: 'ENTJ')
personality_ENFJ = Personality.find_by(title: 'ENFJ')
personality_ENTP = Personality.find_by(title: 'ENTP')
personality_ENFP = Personality.find_by(title: 'ENFP')

##################################################
#_____________________TRAITS_____________________#
##################################################
traits_array = [
  {title: 'Extraversion', symbol: 'E',description: "Extraversion is characterized by a preference to focus on the world outside the self. Extraverts are energized by social gatherings, parties and group activities. Extraverts are usually enthusiastic, gregarious and animated. Their communication style is verbal and assertive. Talking helps Extraverts think. They enjoy limelight."},
  {title: 'Introversion', symbol: 'I', description: "Introversion is characterized by a preference to focus on theinside world. Introverts are energized by spending time alone or with a small group. They find large group gatherings draining because they seek depth instead of breadth of relationships. Introverts process information internally. They are great listeners and think before talking."},
  {title: 'Sensing', symbol: 'S', description: "Sensors focus on the present. They are “here and now” people. They are factual and process information through the five senses. They see things as they are because they are concrete and literal thinkers. They trust what is certain. Sensors value realism and common sense. They especially like ideas with practical applications."},
  {title: 'Intuition', symbol: 'N', description: "Intuitive people live in the future and are immersed in the world of possibilities. They process information through patterns and impressions. Intuitive people value inspiration and imagination. They gather knowledge by reading between the lines. Their abstract nature attracts them toward deep ideas and concepts. They see the \"big picture\"."},
  {title: 'Thinking', symbol: 'T', description: "Thinking people are objective. They make decisions based on facts. They are ruled by their head instead of their heart. Thinking people judge situations and others based on logic. They value truth over tact and can easily identify flaws. They are critical thinkers and oriented toward problem solving. Thinking does not mean a person is without emotion."},
  {title: 'Feeling', symbol: 'F', description: "Feeling people are subjective. They make decisions based on principles and values. They are ruled by their heart instead of their head. Feeling people judge situations and others based on feelings and extenuating circumstances. They seek to please others and want to be appreciated. They value harmony and empathy."},
  {title: 'Judging', symbol: 'J', description: "Judging people think sequentially. They value order and organization. Their lives are scheduled and structured. Judging people seek closure and enjoy completing tasks. They take deadlines seriously. They work then they play. The Judging preference does not mean judgmental. Judging refers to how a person deals with day-to-day activities."},
  {title: 'Perceiving', symbol: 'P', description: "Perceivers are adaptable and flexible. They are random thinkers who prefer to keep their options open. Perceivers thrive with the unexpected and are open to change. They are spontaneous and often juggle several projects at once. They enjoy starting a task better than finishing it. Deadlines are often merely suggestions. Perceivers play as they work."}
]

traits_array.each do |trait|
  Trait.create(trait)
  puts "Created #{trait[:title]}"
end

##################################################
#_______________TRAIT COMBINATIONS_______________#
##################################################
extraversion = Trait.find_by(title: 'Extraversion')
introversion = Trait.find_by(title: 'Introversion')
sensing = Trait.find_by(title: 'Sensing')
intuition = Trait.find_by(title: 'Intuition')
thinking = Trait.find_by(title: 'Thinking')
feeling = Trait.find_by(title: 'Feeling')
judging = Trait.find_by(title: 'Judging')
perceiving = Trait.find_by(title: 'Perceiving')

trait_combo_array = [
  {trait: introversion, personality: Personality.find_by(title: 'ISTJ')},
  {trait: introversion, personality: Personality.find_by(title: 'ISFJ')},
  {trait: introversion, personality: Personality.find_by(title: 'ISTP')},
  {trait: introversion, personality: Personality.find_by(title: 'ISFP')},
  {trait: introversion, personality: Personality.find_by(title: 'INTJ')},
  {trait: introversion, personality: Personality.find_by(title: 'INFJ')},
  {trait: introversion, personality: Personality.find_by(title: 'INTP')},
  {trait: introversion, personality: Personality.find_by(title: 'INFP')},
  {trait: extraversion, personality: Personality.find_by(title: 'ESTJ')},
  {trait: extraversion, personality: Personality.find_by(title: 'ESFJ')},
  {trait: extraversion, personality: Personality.find_by(title: 'ESTP')},
  {trait: extraversion, personality: Personality.find_by(title: 'ESFP')},
  {trait: extraversion, personality: Personality.find_by(title: 'ENTJ')},
  {trait: extraversion, personality: Personality.find_by(title: 'ENFJ')},
  {trait: extraversion, personality: Personality.find_by(title: 'ENTP')},
  {trait: extraversion, personality: Personality.find_by(title: 'ENFP')},
  {trait: sensing, personality: Personality.find_by(title: 'ISTJ')},
  {trait: sensing, personality: Personality.find_by(title: 'ISFJ')},
  {trait: sensing, personality: Personality.find_by(title: 'ISTP')},
  {trait: sensing, personality: Personality.find_by(title: 'ISFP')},
  {trait: sensing, personality: Personality.find_by(title: 'ESTJ')},
  {trait: sensing, personality: Personality.find_by(title: 'ESFJ')},
  {trait: sensing, personality: Personality.find_by(title: 'ESTP')},
  {trait: sensing, personality: Personality.find_by(title: 'ESFP')},
  {trait: intuition, personality: Personality.find_by(title: 'INTJ')},
  {trait: intuition, personality: Personality.find_by(title: 'INFJ')},
  {trait: intuition, personality: Personality.find_by(title: 'INTP')},
  {trait: intuition, personality: Personality.find_by(title: 'INFP')},
  {trait: intuition, personality: Personality.find_by(title: 'ENTJ')},
  {trait: intuition, personality: Personality.find_by(title: 'ENFJ')},
  {trait: intuition, personality: Personality.find_by(title: 'ENTP')},
  {trait: intuition, personality: Personality.find_by(title: 'ENFP')},
  {trait: thinking, personality: Personality.find_by(title: 'ISTJ')},
  {trait: thinking, personality: Personality.find_by(title: 'ISTP')},
  {trait: thinking, personality: Personality.find_by(title: 'INTJ')},
  {trait: thinking, personality: Personality.find_by(title: 'INTP')},
  {trait: thinking, personality: Personality.find_by(title: 'ESTJ')},
  {trait: thinking, personality: Personality.find_by(title: 'ESTP')},
  {trait: thinking, personality: Personality.find_by(title: 'ENTJ')},
  {trait: thinking, personality: Personality.find_by(title: 'ENTP')},
  {trait: feeling, personality: Personality.find_by(title: 'ISFJ')},
  {trait: feeling, personality: Personality.find_by(title: 'ISFP')},
  {trait: feeling, personality: Personality.find_by(title: 'INFJ')},
  {trait: feeling, personality: Personality.find_by(title: 'INFP')},
  {trait: feeling, personality: Personality.find_by(title: 'ESFJ')},
  {trait: feeling, personality: Personality.find_by(title: 'ESFP')},
  {trait: feeling, personality: Personality.find_by(title: 'ENFJ')},
  {trait: feeling, personality: Personality.find_by(title: 'ENFP')},
  {trait: judging, personality: Personality.find_by(title: 'ISTJ')},
  {trait: judging, personality: Personality.find_by(title: 'ISFJ')},
  {trait: judging, personality: Personality.find_by(title: 'INTJ')},
  {trait: judging, personality: Personality.find_by(title: 'INFJ')},
  {trait: judging, personality: Personality.find_by(title: 'ESTJ')},
  {trait: judging, personality: Personality.find_by(title: 'ESFJ')},
  {trait: judging, personality: Personality.find_by(title: 'ENTJ')},
  {trait: judging, personality: Personality.find_by(title: 'ENFJ')},
  {trait: perceiving, personality: Personality.find_by(title: 'ISTP')},
  {trait: perceiving, personality: Personality.find_by(title: 'ISFP')},
  {trait: perceiving, personality: Personality.find_by(title: 'INTP')},
  {trait: perceiving, personality: Personality.find_by(title: 'INFP')},
  {trait: perceiving, personality: Personality.find_by(title: 'ESTP')},
  {trait: perceiving, personality: Personality.find_by(title: 'ESFP')},
  {trait: perceiving, personality: Personality.find_by(title: 'ENTP')},
  {trait: perceiving, personality: Personality.find_by(title: 'ENFP')},
]

trait_combo_array.each_with_index do |trait_combo, i|
  TraitCombination.create(trait_combo)
  puts "Created Combination #{i + 1} of #{trait_combo_array.length}"
end

##################################################
#____________________ANSWERS_____________________#
##################################################
answers_array = [
  {trait: Trait.find_by(title: 'Extraversion'), content: "I am seen as \"outgoing\" or as a \"people person.\""},
  {trait: Trait.find_by(title: 'Extraversion'), content: "I feel comfortable in groups and like working in them."},
  {trait: Trait.find_by(title: 'Extraversion'), content: "I have a wide range of friends and know lots of people."},
  {trait: Trait.find_by(title: 'Extraversion'), content: "I sometimes jump too quickly into an activity and don't allow enough time to think it over."},
  {trait: Trait.find_by(title: 'Extraversion'), content: "Before I start a project, I sometimes forget to stop and get clear on what I want to do and why."},
  {trait: Trait.find_by(title: 'Introversion'), content: "I am seen as \"reflective\" or \"reserved.\""},
  {trait: Trait.find_by(title: 'Introversion'), content: "I feel comfortable being alone and like things I can do on my own."},
  {trait: Trait.find_by(title: 'Introversion'), content: "I prefer to know just a few people well."},
  {trait: Trait.find_by(title: 'Introversion'), content: "I sometimes spend too much time reflecting and don't move into action quickly enough."},
  {trait: Trait.find_by(title: 'Introversion'), content: "I sometimes forget to check with the outside world to see if my ideas really fit the experience."},
  {trait: Trait.find_by(title: 'Sensing'), content: "I remember events as snapshots of what actually happened."},
  {trait: Trait.find_by(title: 'Sensing'), content: "I solve problems by working through facts until I understand the problem."},
  {trait: Trait.find_by(title: 'Sensing'), content: "I am pragmatic and look to the \"bottom line.\""},
  {trait: Trait.find_by(title: 'Sensing'), content: "I start with facts and then form a big picture."},
  {trait: Trait.find_by(title: 'Sensing'), content: "I trust experience first and trust words and symbols less."},
  {trait: Trait.find_by(title: 'Sensing'), content: "Sometimes I pay so much attention to facts, either present or past, that I miss new possibilities."},
  {trait: Trait.find_by(title: 'Intuition'), content: "I remember events by what I read \"between the lines\" about their meaning."},
  {trait: Trait.find_by(title: 'Intuition'), content: "I solve problems by leaping between different ideas and possibilities."},
  {trait: Trait.find_by(title: 'Intuition'), content: "I am interested in doing things that are new and different."},
  {trait: Trait.find_by(title: 'Intuition'), content: "I like to see the big picture, then to find out the facts."},
  {trait: Trait.find_by(title: 'Intuition'), content: "I trust impressions, symbols, and metaphors more than what I actually experienced"},
  {trait: Trait.find_by(title: 'Intuition'), content: "Sometimes I think so much about new possibilities that I never look at how to make them a reality."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I enjoy technical and scientific fields where logic is important."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I notice inconsistencies."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I look for logical explanations or solutions to most everything."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I make decisions with my head and want to be fair."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I believe telling the truth is more important than being tactful."},
  {trait: Trait.find_by(title: 'Thinking'), content: "Sometimes I miss or don't value the \"people\" part of a situation."},
  {trait: Trait.find_by(title: 'Thinking'), content: "I can be seen as too task-oriented, uncaring, or indifferent."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I have a people or communications orientation."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I am concerned with harmony and nervous when it is missing."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I look for what is important to others and express concern for others."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I make decisions with my heart and want to be compassionate."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I believe being tactful is more important than telling the \"cold\" truth."},
  {trait: Trait.find_by(title: 'Feeling'), content: "Sometimes I miss seeing or communicating the \"hard truth\" of situations."},
  {trait: Trait.find_by(title: 'Feeling'), content: "I am sometimes experienced by others as too idealistic, mushy, or indirect."},
  {trait: Trait.find_by(title: 'Judging'), content: "I like to have things decided."},
  {trait: Trait.find_by(title: 'Judging'), content: "I appear to be task oriented."},
  {trait: Trait.find_by(title: 'Judging'), content: "I like to make lists of things to do."},
  {trait: Trait.find_by(title: 'Judging'), content: "I like to get my work done before playing."},
  {trait: Trait.find_by(title: 'Judging'), content: "I plan work to avoid rushing just before a deadline."},
  {trait: Trait.find_by(title: 'Judging'), content: "Sometimes I focus so much on the goal that I miss new information."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "I like to stay open to respond to whatever happens."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "I appear to be loose and casual. I like to keep plans to a minimum."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "I like to approach work as play or mix work and play."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "I work in bursts of energy."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "I am stimulated by an approaching deadline."},
  {trait: Trait.find_by(title: 'Perceiving'), content: "Sometimes I stay open to new information so long I miss making decisions when they are needed."}
]

answers_array.each_with_index do |answer, i|
  Answer.create(answer)
  puts "Created answer #{i + 1} of #{answers_array.length}"
end

##################################################
#______________CHARACTER SCRAPING________________#
##################################################
naruto_characters = [
  {name: "Sasuke_Uchiha", personality: personality_INTJ},
  {name: "Naruto_Uzumaki", personality: personality_ENFP},
  {name: "Kakashi_Hatake", personality: personality_INTP},
  {name: "Nagato", personality: personality_INFP},
  {name: "Madara_Uchiha", personality: personality_ENTJ},
  {name: "Jugo", personality: personality_ISFP},
  {name: "Neji", personality: personality_ISTJ},
  {name: "Sakura_Haruno", personality: personality_ESFJ},
  {name: "Hinata", personality: personality_ISFJ},
  {name: "Tsunade", personality: personality_ESTJ},
  {name: "Mei", personality: personality_ENFJ},
  {name: "Konan", personality: personality_ISFJ},
  {name: "Kurenai", personality: personality_INFJ}
]
fairytail_characters = [
  {name: "Erza_Scarlet", personality: personality_ESTJ},
  {name: "Lucy_Heartfilia", personality: personality_ENFP},
  {name: "Wendy_Marvell", personality: personality_INFP},
  {name: "Mirajane_Strauss", personality: personality_INFP},
  {name: "Cana_Alberona", personality: personality_ESTP},
  {name: "Natsu_Dragneel", personality: personality_ESFP},
  {name: "Gray_Fullbuster", personality: personality_ISTP},
  {name: "Gajeel_Redfox", personality: personality_ISTP},
  {name: "Mystogan", personality: personality_INFJ},
  {name: 'Loke', personality: personality_ENTP}
]

scraper(naruto_characters, "https://naruto.fandom.com/wiki/", "Naruto")
scraper(fairytail_characters, "https://fairytail.fandom.com/wiki/", "Fairy Tail")

##################################################
#_____________________USERS______________________#
##################################################
User.create({email: "wendy@aim.com", password: "000111", gender: "Female", preference: "Both", username: "SpicyMuffin2000", age: 19})
User.create({email: "Liikemike@aim.com", password: "000111", gender: "Male", preference: "Female", username: "Liikemike", age: 18})
