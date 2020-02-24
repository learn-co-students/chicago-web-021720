

class Bio < TwitterContent

  attr_writer :message

  def initialize(args)
    super
    @message = args[:message]
  end

end
