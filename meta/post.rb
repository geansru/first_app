require 'ostruct'
class PostBuilder
  attr_accessor :title, :tags
  def body &block
#    yield self
  end

  def attributes
    OpenStruct.new(title: @title, tags: @tags, body: @body)
  end
end

class Post
  def initializer &block
    @builder = PostBuilder.new
    yield @builder
    p @builder
    puts "======================"
  end
  
  def attributes
    @builder.attributes.to_h do |k,v|
      puts "#{k} : #{v}"
    end
  end

end

post  = Post.new do |builder|
  builder.title "Hello!"
  builder.tags "first", "hello"
  builder.body do |body|
    body.paragraph "This is my first post"
    body.horizontal_rule
    body.image "my_img.jpg", "awesome"
  end
end

#puts post.attributes
