require 'open-uri'
require 'nokogiri'
require_relative 'post'
require_relative 'comment_creator'
require_relative 'post_creator'

doc = Nokogiri::HTML(File.open('post.html'))

url = ARGV[0]
post = PostCreator.create_post(doc, url)

post.comment_arr = CommentCreator.create_comment_arr(doc)

puts "Post title: #{post.title}"
puts "Number of comments: #{post.comment_arr.length}"

# $ ruby hn_scraper.rb https://news.ycombinator.com/item?id=5003980
# Post title: XXXXXX
# Number of comments: XXXXX
# ... some other statistics we might be interested in -- your choice ...
# $