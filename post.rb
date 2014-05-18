
class Post
  attr_accessor :comment_arr
  attr_reader :title, :url, :points, :item_id
  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comment_arr = []
  end
end