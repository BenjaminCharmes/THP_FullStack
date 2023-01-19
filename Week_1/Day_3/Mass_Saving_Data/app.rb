require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'

# scrapping = Scrapper.new.save_as_json

# scrapping = Scrapper.new.save_as_csv

# scrapping = Scrapper.new.save_as_spreadsheet