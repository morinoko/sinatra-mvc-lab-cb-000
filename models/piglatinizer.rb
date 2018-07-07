# Pig Latin Rules:
# Words that begin with vowels: simply add "way" to the end.
# Words that begin with constanants: move first series of
# constanants to end of word and add "ay"

class PigLatinizer
  def piglatinize(phrase)
    words_array = phrase.split(" ")

    words_in_pig_latin = words_array.collect { |word| convert_word_to_pig_latin(word) }
    words_in_pig_latin.join(" ")
  end

  private

  # Find words that begin with one or more vowels: ^[aeiou]+
  # Find words that begin with one of more constanants: ^[^aeiou]+
  def convert_word_to_pig_latin(word)

    # Regex matches any word that begins with a vowel
    if word.match(/^[aeiouAEIOU]/)
      word_in_pig_latin = word + "way"
    else
      # Regex returns the first series of constanants of the word
      constanants = word.match(/^[^aeiouAEIOU]+/).to_s

      word_in_pig_latin = word.sub(constanants, '') + constanants + "ay"
    end
  end
end




### My Alternative
# class PigLatinizer
#   attr_reader :phrase
#
#   def initialize(phrase)
#     @phrase = phrase
#   end
#
#   def piglatinize
#     words = @phrase.split(" ")
#
#     words_in_pig_latin = words.collect { |word| convert_word_to_pig_latin(word) }
#     words_in_pig_latin.join(" ")
#   end
#
#   private
#
#   def convert_word_to_pig_latin(word)
#
#     # Regex matches any word that begins with a vowel
#     if word.match(/^[aeiouAEIOU]/)
#       word_in_pig_latin = word + "way"
#     else
#       # Regex returns the first series of constanants of the word
#       constanants = word.match(/^[^aeiouAEIOU]+/).to_s
#
#       word_in_pig_latin = word.delete(constanants) + constanants + "ay"
#     end
#   end
# end
