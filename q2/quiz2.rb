def parse_file(filename)
  students = []

  File.foreach(filename, encoding: "ISO-8859-1") do |line|
    if line =~ /(\d{2}\/\d{7})\s+(.+)/
      matricula = $1.strip
      nome = $2.strip
      students << [matricula, nome]
    end
  end

  if block_given?
    students.sort_by! { |matricula, nome| yield(matricula, nome) }
  end

  students.each do |matricula, nome|
    puts "#{matricula}\t#{nome}"
  end
end

# Ordenar por matrícula
puts "Ordenado por matrícula:"
parse_file("engsoft.txt") { |matricula, _nome| matricula }

puts "\nOrdenado por nome:"
# Ordenar por nome
parse_file("engsoft.txt") { |_matricula, nome| nome }