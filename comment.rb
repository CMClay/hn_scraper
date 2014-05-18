
class Comment
  attr_reader :user, :date, :content
  def initialize(user, date, content)
    @user = user
    @date = date
    @content = content
  end

  def formated_date
    @date.strftime('%B %d, %Y')
  end
end