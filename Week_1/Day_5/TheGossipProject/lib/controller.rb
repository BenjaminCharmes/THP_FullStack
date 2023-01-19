require 'gossip'
require 'view'

class Controller

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    array_gossips = Gossip.all
    @view.index_gossips(array_gossips)
  end

  def delete_gossip
    gossip_to_delete = @view.delete_gossip
    Gossip.delete_gossip(gossip_to_delete)
  end

end