class Gossip
  attr_reader :author, :content

  def initialize(content, author)
    @content = content
    @author = author
  end

  def save
    CSV.open("db/gossip.csv", "ab") do |csv|
      csv << [@content, @author]
    end
  end

  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = Gossip.all
    return all_gossips[id.to_i]
  end

  def self.update(id, content, author)
    all_gossips = Gossip.all
    all_gossips.delete_at(id)
    all_gossips.insert(id, Gossip.new(content, author))
    CSV.open("db/gossip.csv", "w") do |csv|
      all_gossips.each do |gossip|
        csv << [gossip.content, gossip.author]
      end
    end
  end

end