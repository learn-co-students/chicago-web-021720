require_relative 'foo'

class TwitterContent
  attr_reader :name, :message

  def initialize(content_args = {})
    raise "HEY!" unless content_args.class == Hash
    @message = content_args[:message]
    @user = content_args[:user]
  end

  def inherited!
    puts "INHERITED FROM THE TWITTER CONTENT CLASS. READ THIS IN AN OBNOXIOUS DJ VOICE"
  end

  def self.class_try
    puts "YOLO I AM CLASSY"
    Foo.bar
  end
end
