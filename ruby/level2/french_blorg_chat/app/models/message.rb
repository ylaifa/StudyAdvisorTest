class Message < ApplicationRecord
  belongs_to :tag, optional: true

  validates :author, presence: true
  validates :content, presence: true
  validates :is_french, presence: true
  validate :is_valid_message?


  TRANSLATION_TABLE = { "A"=>"rgbh", "B"=>"brug", "C"=>"bgou", "D"=>"olgr", "E"=>"lorh", "F"=>"gbhu", "G"=>"rlgo", "H"=>"burh", "I"=>"ghob", "J"=>"lrug", "K"=>"rhol", "L"=>"grbl", "M"=>"uhog", "N"=>"glhu", "O"=>"rgob", "P"=>"orgh", "Q"=>"lrob", "R"=>"ogru", "S"=>"uhgb", "T"=>"uhob", "U"=>"hrbo", "V"=>"rgub", "W"=>"ruob", "X"=>"orhu", "Y"=>"ublo", "Z"=>"ohbr", "!"=>"rblg", ","=>"uohr", "."=>"obgl", "?"=>"grlh" }.freeze

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
    message = self.set_french_message
    final_message = Array.new
    message_split_array = message.split(/ /)
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
    message = self.set_blorg_message
    final_message = Array.new
    word_array = message.split(/  /)
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
        errors.add(:content, "Merci d'entrer un message valide") 
      end
    end
    return message
  end

  # Permet de normaliser et valider le message blourg à traduire.
  def set_blorg_message
    message = self.normalize
    blorg_letter_array = message.split
    blorg_alphabet = Array.new
    TRANSLATION_TABLE.each do |key, value|
      blorg_alphabet.push(value)
    end
    blorg_letter_array.each do |letter|
      if blorg_alphabet.include?(letter) == false
        errors.add(:content, "Merci d'entrer un message valide") 
      end
    end
    return message
  end

  # Permet de vérifier si le message est valide, afin d'être traduit.
  def is_valid_message?
    set_french_message || set_blorg_message ? true : false
  end
end
