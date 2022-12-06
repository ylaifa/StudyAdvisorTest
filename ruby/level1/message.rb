class Message
  TRANSLATION_TABLE = {
    "A"=>"rgbh",
    "B"=>"brug",
    "C"=>"bgou",
    "D"=>"olgr",
    "E"=>"lorh",
    "F"=>"gbhu",
    "G"=>"rlgo",
    "H"=>"burh",
    "I"=>"ghob",
    "J"=>"lrug",
    "K"=>"rhol",
    "L"=>"grbl",
    "M"=>"uhog",
    "N"=>"glhu",
    "O"=>"rgob",
    "P"=>"orgh",
    "Q"=>"lrob",
    "R"=>"ogru",
    "S"=>"uhgb",
    "T"=>"uhob",
    "U"=>"hrbo",
    "V"=>"rgub",
    "W"=>"ruob",
    "X"=>"orhu",
    "Y"=>"ublo",
    "Z"=>"ohbr",
    "!"=>"rblg",
    ","=>"uohr",
    "."=>"obgl",
    "?"=>"grlh"
  }.freeze

  attr_accessor :content, :is_french

  def initialize(content, is_french)
    @content = content
    @is_french = is_french
  end

  # Permet d'encoder ou de décoder une lettre
  def translate_one_letter(letter)
    TRANSLATION_TABLE.each do |key, value|
      if key == letter
        return value
      elsif value == letter
        return key
      end
    end
  end

  # Permet d'encoder un message de français à blourg
  def encode
    final_message = Array.new
    message_split_array = self.content.split(/ /)
    message_split_array.each do |word|
      blorg_word = Array.new
      word.each_char do |letter|
        blorg_word.push(translate_one_letter(letter))
      end
        final_message.push(blorg_word.join(" "))
    end
    final_message.join("  ")
  end

  # Permet de décoder un message de blourg à français
  def decode
    final_message = Array.new
    word_array = self.content.split(/  /)
    word_array.each do |word|
      letter_array = word.split(/ /)
      french_word = ""
      letter_array.each do |letter|
        french_word.concat(translate_one_letter(letter).to_s)
      end
      final_message.push(french_word)
    end
    return final_message.join(" ")
  end

  # Permet de normaliser l'entrée de la méthode en fonction de la langue.
  def normalize
    self.is_french ? self.content.to_s.upcase : self.content.to_s.downcase
  end

  # Permet de normaliser et valider le message français à traduire.
  def set_french_message
    message = self.normalize
    french_letter_array = message.split(%r{\s*})
    french_alphabet = Array.new
    TRANSLATION_TABLE.each do |key, value|
      french_alphabet.push(key)
    end
    french_letter_array.each do |letter|
      if french_alphabet.include?(letter) == false
        return "Merci d'enter un message valide"  
      end
    end
    return message
  end
end