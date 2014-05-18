class PostCreator
  class << self
    def create_post(doc, url)
      title = extract_title(doc)
      points = extract_points(doc)
      item_id = url.split("=")[-1].to_i
      Post.new(title, url, points, item_id)
    end

    def extract_title(doc)
      doc.search('.title > a').inner_text
    end

    def extract_points(doc)
      string = doc.search('.subtext').inner_text
      points = string.split(" ")[0].to_i
    end
  end
end