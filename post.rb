
class Post
  
  def initialize(title, url, points, item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comment_arr = []
  end

  def comments
    #returns all comments
  end

  def add_comment(comment)
    @comment_arr << comment 
  end
end