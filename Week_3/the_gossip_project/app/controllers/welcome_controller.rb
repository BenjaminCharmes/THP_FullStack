class WelcomeController < ApplicationController
  def home
    @gossips = Gossip.all
  end
end
