class View

  def create_gossip
    puts
    puts "ℹ️  - Qui est l'auteur de ce gossip !?"
    puts
    print "🖍  > "
    puts view_author = gets.chomp
    puts
    puts "ℹ️  - C'est quoi le gossip !?"
    puts
    print "🖍  > "
    puts view_content = gets.chomp
    puts
    system 'clear'
    return params = {content: view_content, author: view_author}
  end

  def index_gossips(gossips)
    count = 1
    puts "Voici la liste de tous les gossips:"
    puts
    gossips.each do |gossip|
      puts "#{count}: #{gossip.content} - #{gossip.author}"
      count += 1
    end
    puts
  end

  def delete_gossip
    puts
    puts "ℹ️  - Quel gossip souhaite-tu supprimer ?"
    puts
    print "🖍  > "
    gossip_to_delete = gets.chomp.to_i
    puts
    system 'clear'
    return gossip_to_delete
  end
  

end