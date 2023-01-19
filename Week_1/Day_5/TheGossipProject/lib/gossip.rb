class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save

    # File.open("db/gossip.json","a") do |f|
    #   f << (JSON.pretty_generate([@content, @author]))
    # end

    CSV.open("db/gossip.csv", "a") do |csv|
      csv << [@content, @author]
    end

  end

  def self.all
    all_gossips = []
    csv_file = CSV.open("db/gossip.csv")
    csv_file.each do |ligne|
        gossip_provisoire = Gossip.new(ligne[1], ligne[0])
        all_gossips << gossip_provisoire
    end
    return all_gossips
  end

  def self.delete_gossip(gossip_to_delete)
    lines = File.readlines("db/gossip.csv")
    lines.delete_at(gossip_to_delete - 1)
    new_lines = lines
    File.open("db/gossip.csv", "w") {|file| file.truncate(0)}
    new_lines.each do |line|
      File.open("db/gossip.csv", "a") {|f| f.write line}
    end
  end
    
end