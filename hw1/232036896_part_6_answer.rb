# Letra a)
class Numeric
  @@currencies = {
    'dollar' => 1.0, 'euro' => 1.292, 'rupee' => 0.019, 'yen' => 0.013
  }

  def method_missing(method_id, *args)
    currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(currency)
      self * @@currencies[currency]
    elsif method_id == :in
      other_currency = args[0].to_s.gsub(/s$/, '')
      self / @@currencies[other_currency]
    else
      super
    end
  end
end


# Letra b)
class String
  def palindrome?
    clean = self.downcase.gsub(/[^a-z]/, "")
    clean == clean.reverse
  end
end


# Letra c)
module Enumerable
  def palindrome?
    self.to_a == self.to_a.reverse
  end
end

p 5.dollars.in(:euros)
p 10.euros.in(:rupees)
p "foo".palindrome?
p [1, 2, 3, 2, 1].palindrome?