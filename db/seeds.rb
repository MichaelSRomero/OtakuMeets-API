
naruto_characters = ["Sasuke_Uchiha", "Naruto_Uzumaki", "Kakashi_Hatake", "Nagato", "Sakura_Haruno", "Hinata", "Tsunade", "Mei"]
fairytail_characters = ["Erza_Scarlet", "Lucy_Heartfilia", "Wendy_Marvell", "Mirajane_Strauss", "Natsu_Dragneel", "Gray_Fullbuster", "Gajeel_Redfox", "Mystogan"]


def scraper(character_list, base_url, character_show)
  characters = []

  character_list.each do |character_name|
    character_url = base_url + character_name
    unparsed_page = HTTParty.get(character_url)
    parsed_page = Nokogiri::HTML(unparsed_page)

    case character_show
      ##################################################
      #________________NARUTO SCRAPING_________________#
      ##################################################
    when 'Naruto'
      # Character Descriptions
      name_array = parsed_page.css('.mainheader span.title').text.split(' ')
      name = name_array.slice(1..2).join(' ')
      alias_index = parsed_page.css('.mainheader li')[0].text.index('(') - 1
      character_alias = parsed_page.css('.mainheader li')[0].text.slice(0...alias_index)
      # finds the 'sex node' and then gets the sibling 'gender'
      sex_node = parsed_page.css('.infobox').children.css('th').find {|node| node.text.gsub(/[\s]/, '') == 'Sex'}
      gender = sex_node.css("~ td").text.gsub(/[\s]/, '')

      # Character Avatars
      images_array = parsed_page.css('div.tabbertab a').map {|img_obj| img_obj['href']}
      single_image = parsed_page.css('.imagecell a')[0]['href']


      images_array << single_image

      character = {
        english_name: name,
        japanese_name: name_array[0],
        gender: gender,
        alias: character_alias,
        show: character_show
      }

      database_character = Character.create(character)
      images_array.each {|image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{name}"
      # characters << character
      ##################################################
      #_______________FAIRYTAIL SCRAPING_______________#
      ##################################################
    when 'Fairy Tail'
      # Character Descriptions
      name = parsed_page.css('h1.page-header__title').text;
      japanese_name = parsed_page.css('div.pi-font')[0].text

      character_alias = nil
      gender = nil
      alias_index = parsed_page.css('div.pi-font')[2].text.index('(')
      # if alias doesn't exist then set to N/A and gender index is at 3
      # else set alias and gender index is at 4
      if alias_index == nil
        character_alias = 'N/A'
        gender = parsed_page.css('div.pi-font')[3].text
      else
        alias_index -= 1
        character_alias = parsed_page.css('div.pi-font')[2].text.slice(0...alias_index)
        gender = parsed_page.css('div.pi-font')[4].text
      end

      # Character Avatars
      unparsed_character_gallery = HTTParty.get(character_url + '/Anime_Gallery')
      parsed_character_gallery = Nokogiri::HTML(unparsed_character_gallery)
      images_array = []

      images_array << parsed_page.css('nav.pi-navigation').css('img.lzyPlcHld')[0]['data-src']

      # Pushing only image src to array
      parsed_character_gallery.css('img.thumbimage').each_with_index do |noko_obj, i|
        i >= 12 ? break : nil
        i % 2 == 0 ? images_array << noko_obj['src'] : nil
      end

      character = {
        english_name: name,
        japanese_name: japanese_name,
        gender: gender,
        alias: character_alias,
        show: character_show
      }

      database_character = Character.create(character)
      images_array.each {|image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{name}"
      # characters << character
      ##################################################
      #________________NO SCRAPING LEFT________________#
      ##################################################
    else
      'Error: No matching case'
    end

  end

  # characters
end

scraper(naruto_characters, "https://naruto.fandom.com/wiki/", "Naruto")
scraper(fairytail_characters, "https://fairytail.fandom.com/wiki/", "Fairy Tail")




User.create({email: "wendy@aim.com", password: "000111", gender: "Female", preference: "Both", username: "SpicyMuffin2000", age: 19})
User.create({email: "Liikemike@aim.com", password: "000111", gender: "Male", preference: "Female", username: "Liikemike", age: 18})
