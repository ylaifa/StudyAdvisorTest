require_relative 'message'

class Blorg
  def perform
    if ARGV[0] == "encode"
      message = Message.new(ARGV[1], true)
      puts message.encode
    elsif ARGV[0] == "decode"
      message = Message.new(ARGV[1], false)
      puts message.decode
    end
  end
end

# Permet de lancer le programme.
Blorg.new.perform