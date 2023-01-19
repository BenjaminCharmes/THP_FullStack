require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'app/game'
require 'app/player'
require 'app/board'
require 'app/board_case'
require 'views/application'

# Launch the_game
the_game = Application.new