require_relative 'comment'
require 'pry'

class CommentCreator
  class << self

    public

    def create_comment_arr(doc)
      time_arr = extract_comment_dates(doc)
      user_arr = extract_usernames(doc)
      content_arr = extract_comment_content(doc)
      validate_arr_size(time_arr, user_arr, content_arr)

      comment_arr = Array.new(time_arr.length) #sets the size of the comment array
      comment_arr.each_index do |i|
        comment_arr[i] = Comment.new(user_arr[i], time_arr[i], content_arr[i])
      end
    end

   private

    def extract_comment_dates(doc)
      comhead_arr = doc.search('.comhead').slice(1..-1) #remove the first element
      comhead_arr.map do |element|
        date_arr = element.inner_text.split(" ").slice(1,2)
        parse_time(date_arr[0].to_i, date_arr[1])
      end
    end

    def parse_time(num, unit_of_time)
      now = Time.new
      if unit_of_time == "days"
        now -= num * 86400 #converts seconds into days
      elsif unit_of_time == "hours"
        now -= num * 3600 #converts seconds into hours
      else
        raise "Inconpatible time unit"
      end
    end

    def extract_usernames(doc)
      doc.search('.comhead > a:first-child').map do |element|
        element.inner_text
      end
    end

    def extract_comment_content(doc)
      doc.search('.comment').map do |element|
        element.inner_text
      end
    end

    def validate_arr_size(time_arr, user_arr, content_arr)
      checksize = time_arr.length == user_arr.length && user_arr.length == content_arr.length
      raise "different size arrays in comment" unless checksize
      return true
    end
  end
end