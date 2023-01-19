require 'bundler'
Bundler.require

$:.unshift File.expand_path('./../lib', __FILE__)
require 'controller'
require 'gossip'
require 'router'
require 'view'

Router.new.perform