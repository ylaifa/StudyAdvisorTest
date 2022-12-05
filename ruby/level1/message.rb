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

  # Permet de normaliser l'entrée de la méthode en fonction de la langue.
  def normalize
    self.is_french ? self.content.upcase : self.content.downcase
  end
end