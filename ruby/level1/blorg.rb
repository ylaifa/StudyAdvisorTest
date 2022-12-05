require_relative 'message'

class Blorg
  def perform
    if ARGV[0] == "encode"
      message = Message.new(ARGV[1], true)
      puts "Voici le message en Blourg :"
      puts message.encode
    elsif ARGV[0] == "decode"
      message = Message.new(ARGV[1], false)
      puts "Voici le message en Français :"
      puts message.decode
    end
  end
end

# Permet de lancer le programme.
Blorg.new.perform