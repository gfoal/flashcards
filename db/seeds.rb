# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'open-uri'

doc = Nokogiri::HTML(open("http://masterrussian.com/vocabulary/most_common_words.htm"))

rows = doc.xpath("//table[@class='topwords']//tr[@class!='rowTop']")

rows.each do |r|
  original_text = r.xpath(".//td[3]/a").text
  translated_text = r.xpath(".//td[4]").text
  Card.create(original_text: original_text, translated_text: translated_text)
end
