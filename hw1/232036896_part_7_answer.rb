class CartesianProduct
  include Enumerable

  def initialize(set_a, set_b)
    @set_a = set_a
    @set_b = set_b
  end

  def each(&block)
    @set_a.each do |a|
      @set_b.each do |b|
        block.call([a, b])
      end
    end
  end
end

puts "Teste 1: a==[:a,:b,:c] and b==[4,5]"
c = CartesianProduct.new([:a,:b, :c], [4,5])
c.each { |elt| puts elt.inspect }
puts "-----"
puts "Teste 2: a==[:a,:b] and b==[]"
c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
