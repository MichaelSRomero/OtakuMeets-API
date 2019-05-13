def scraper(character_list, base_url, character_show)

  character_list.each do |character_obj|
    if !!character_obj[:name]
      character_url = base_url + character_obj[:name]
      unparsed_page = HTTParty.get(character_url)
      parsed_page = Nokogiri::HTML(unparsed_page)
    end

    case character_show
      ##################################################
      #________________NARUTO SCRAPING_________________#
      ##################################################
    when 'Naruto'
      # Character Descriptions
      name_array = parsed_page.css('.mainheader span.title').text.split(' ')
      name = name_array.slice(1..2).join(' ')

      character_alias = nil
      alias_index = parsed_page.css('.mainheader li')[0]
      # if alias doesn't exist then set to N/A
      # else set alias
      if alias_index == nil
        character_alias = 'N/A'
      else
        new_index = alias_index.text.index('(') - 1
        character_alias = parsed_page.css('.mainheader li')[0].text.slice(0...new_index)
      end

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
        show: character_show,
        personality: character_obj[:personality]
      }

      database_character = Character.create(character)
      images_array.each {|image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{name}"
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

      img_link = parsed_page.css('nav.pi-navigation').css('img.lzyPlcHld')[0]['data-src']
      slice_index = img_link.index("scale")

      images_array << img_link.slice(0...slice_index)

      # Pushing only image src to array
      parsed_character_gallery.css('img.thumbimage').each_with_index do |noko_obj, i|
        noko_slice_index = noko_obj['src'].index("scale")
        i >= 12 ? break : nil
        i % 2 == 0 ? images_array << noko_obj['src'].slice(0...noko_slice_index) : nil
      end

      character = {
        english_name: name,
        japanese_name: japanese_name,
        gender: gender,
        alias: character_alias,
        show: character_show,
        personality: character_obj[:personality]
      }

      database_character = Character.create(character)
      images_array.each {|image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{name}"
      ##################################################
      #________________BLEACH SCRAPING_________________#
      ##################################################
    when 'Bleach'
      # Character Descriptions
      name = parsed_page.css("td[colspan='2']")[0].text.split(' ').join(' ')
      gender_index = parsed_page.css("table").css('td').text.index("Gender")
      end_of_gender_index = parsed_page.css("table").css('td').text.index("Height")
      gender_array = parsed_page.css("table").css('td').text.slice(gender_index...end_of_gender_index).split(' ')
      gender = gender_array[1]

      # Character Avatars
      unparsed_character_gallery = HTTParty.get(character_url + '/Image_Gallery')
      parsed_character_gallery = Nokogiri::HTML(unparsed_character_gallery)
      images_array = []

      # Push single image
      images_array << parsed_page.css('a.image')[0]['href']
      # Pushing only image src to array
      parsed_character_gallery.css('img.thumbimage').each_with_index do |noko_obj, i|
        noko_slice_index = noko_obj['src'].index("scale")
        noko_slice_end_index = noko_obj['src'].index("?cb")
        i >= 8 ? break : nil
        i % 2 == 0 ? images_array << noko_obj['src'].slice(0...noko_slice_index) + noko_obj['src'].slice(noko_slice_end_index..-1) : nil
      end

      character = {
        english_name: name,
        japanese_name: "N/A",
        gender: gender,
        alias: "N/A",
        show: character_show,
        personality: character_obj[:personality]
      }

      database_character = Character.create(character)
      images_array.each {|image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{name}"
      ##################################################
      #_______________FOOD WARS SCRAPING_______________#
      ##################################################
    when 'Food Wars'

      character = {
        english_name: character_obj[:character][:english_name],
        japanese_name: character_obj[:character][:japanese_name],
        gender: character_obj[:character][:gender],
        alias: "N/A",
        show: character_show,
        personality: character_obj[:character][:personality]
      }

      database_character = Character.create(character)
      character_obj[:images].each { |image| Avatar.create(image_url: image, character: database_character)}
      puts "added #{character_obj[:character][:english_name]}"
      ##################################################
      #________________NO SCRAPING LEFT________________#
      ##################################################
    else
      'Error: No matching case'
    end

  end

end
