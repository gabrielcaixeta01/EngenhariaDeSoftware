def parse_file(filename)
  File.foreach(filename, encoding: "ISO-8859-1") do |line|
    # Regex: matrícula no formato 2 dígitos / 7 dígitos
    if line =~ /(\d{2}\/\d{7})\s+(.+)/
      matricula = $1.strip
      nome = $2.strip
      puts "#{matricula}\t#{nome}"
    end
  end
end

# Chamada
parse_file("engsoft.txt")