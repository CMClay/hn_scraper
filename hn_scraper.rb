require 'open-uri'
require 'nokogiri'
require_relative 'post'

doc = Nokogiri::HTML(File.open('post.html'))


def extract_title(doc)
  doc.search('title').map do |element|
    element.inner_text
  end
end

def extract_comment_content(doc)
  doc.search('.comment')
end

def extract_usernames(doc)
  doc.search('.comhead > a:first-child').map do |element|
    element.inner_text
  end
end

def extract_comment_dates(doc)
  dates_arr = doc.search('.comhead').map do |element|
    element.inner_text.split(" ").slice(1,2)
  end
  return dates_arr.slice(1..-1)
end

def extract_points(doc)
  string = doc.search('.subtext').inner_text
  points = string.split(" ")[0].to_i
end

title = extract_title(doc)
url = ARGV[0]
points = extract_points(doc)
item_id = url.split("=")[-1].to_i

post = Post.new(title, url, points, item_id)

# puts comments.length
# puts extract_comment_content(doc).length

def test(doc)
  doc.search('.comhead')[1].inner_text
end

 p extract_comment_dates(doc)



# puts test(doc)



