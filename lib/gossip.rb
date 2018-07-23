require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv", "a+") do |csv|
      csv << [@author, @content]
    end
  end

  def Gossip.all
      all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    return all_gossips
  end

  def Gossip.find(id)
    return CSV.read("./db/gossip.csv")[id]
  end

end
