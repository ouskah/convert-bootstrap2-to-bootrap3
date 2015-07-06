#/usr/bin/env ruby

require 'rubygems'
require 'nokogiri'
require 'open-uri'

BOOTSTRAP_MIGRATION_URL = "http://getbootstrap.com/migration/"
page = Nokogiri::HTML(open(BOOTSTRAP_MIGRATION_URL))
table = page.css('table.table.table-bordered.table-striped')[0]
rows = table.css('tbody tr')
dictionnary = Hash.new
rows.each do |row|
  dictionnary[row.css('td code')[0].text] = row.css('td code')[1].text
end

# Parse ALL files in Rails root
# Find and replace by dictionnary
