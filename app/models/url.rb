class Url < ActiveRecord::Base
	validates :link, presence: true

  def to62 
    integer = id
    digits = []
    base62 = (0..9).to_a.concat( ('a'..'z').to_a.concat(('A'..'Z').to_a))
    while integer >0
      remainder = integer % 62
      digits.push(base62[remainder])
      integer = integer/62
    end
   digits.reverse.collect{|i| i.to_s}
 end

  def self.toInt(shit)
    sum = 0
    base62 = (0..9).to_a.concat( ('a'..'z').to_a.concat(('A'..'Z').to_a)).join()
    shit.each  do |letter|
      sum = sum * 62 + base62.index(letter); 
    end
    return sum
  end

end
