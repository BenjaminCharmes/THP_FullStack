class Scrapper

  def initialize

  end

  def scrapper
    return page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html")) 
  end

  def get_townhall_url(page)
    puts " "
    print "Récupération des liens de la page de chaque commune "
    sleep(0.25)
    print "."
    sleep(0.25)
    print "."
    sleep(0.25)
    print "."
    sleep(0.25)
    print " "
    # Récuperer les liens de la page de chaque mairie
    scrap_all_link_commune = page.xpath('//a[@class="lientxt"]')
    all_email_link_href = []
    scrap_all_link_commune.each do |email_link_href|
      all_email_link_href.push(email_link_href['href'])
    end 

    # Le mettre sous forme de liens 
    all_email_link = all_email_link_href.map {|href| "http://annuaire-des-mairies.com" + href[1..-1]}

    puts "Terminé. ✅"

    return all_email_link

  end

  def get_townhall_name(scrap_all_link_commune)

    # Récuperer un array des noms des villes
    all_commune_adress_name = []
    scrap_all_link_commune.each do |commune_name|
      all_commune_adress_name.push(commune_name)
    end 

    all_commune_name = all_commune_adress_name.map {|name| name.gsub('http://annuaire-des-mairies.com/95/', '')}.map {|name| name.gsub('.html', '')}

    return all_commune_name

  end  

  def get_townhall_email(all_email_link)

    puts " "
    print "Récupération des adresses mails de chaque mairie "
    sleep(0.25)
    print "."
    sleep(0.25)
    print "."
    sleep(0.25)
    print "."
    sleep(0.25)
    print " "
    # Récuperer l'adresse mail sur chaque page de chaque mairie
    all_email_commune = []
    all_email_link.each do |email_link|
      email_page = Nokogiri::HTML(URI.open("#{email_link}"))
      scrap_all_email_commune = email_page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]')
      all_email_commune.push(scrap_all_email_commune)
    end 

    all_email_commune_text = []

    all_email_commune.each do |email_link_text|
      all_email_commune_text.push(email_link_text.text)
    end

    puts "Terminé. ✅"

  return all_email_commune_text

  end 

  def array_of_hash(all_commune_name, all_email_commune_text)
    data = []

    array_length = all_commune_name.length

    for i in 0..(array_length - 1) 
      hash = {all_commune_name[i] => all_email_commune_text[i]}
      data.push(hash)
    end

    puts " "
    puts "Voici la liste des adresses mails de la mairie de chaque commune du département du Val-d'Oise: "
    puts " "
    puts data
    return data
  end

  def perform
    all_email_link = get_townhall_url(scrapper)
    all_commune_name = get_townhall_name(all_email_link)
    all_email_commune_text = get_townhall_email(all_email_link)
    array_of_hash(all_commune_name, all_email_commune_text)
  end 

  def save_as_json
    array_of_hash = perform

    File.open("db/emails.json","w") do |f|
      f.write(JSON.pretty_generate(array_of_hash))
    end
  end

  def save_as_spreadsheet
    array_of_hash = perform

    # Creates a session. This will prompt the credential via command line for the
    # first time and save it to config.json file for later usages.
    # See this document to learn how to create config.json:
    # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
    session = GoogleDrive::Session.from_config("config.json")

    # First worksheet of
    # https://docs.google.com/spreadsheets/d/1k4H-qQIxN4YsKIaC9nMXp9FdHixup9k2SEWFXQzef0M/edit#gid=0
    ws = session.spreadsheet_by_key("1k4H-qQIxN4YsKIaC9nMXp9FdHixup9k2SEWFXQzef0M").worksheets[0]

    count = 1

    array_of_hash.each do |hash|
      hash.each do |k, v|
        ws[count, 1] = k
        ws[count, 2] = v
        ws.save
        count += 1
        sleep(1)
      end
    end

  end

  def save_as_csv
    array_of_hash = perform
    CSV.open("db/emails.csv", "wb") do |csv|
      array_of_hash.each do |hash|
        hash.to_a.each do |elem|
        csv << elem
        end
      end
    end
  end

end