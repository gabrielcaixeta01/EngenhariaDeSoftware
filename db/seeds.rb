# db/seeds.rb
movies = [
  { title: "The Terminator", rating: "R",  release_date: Date.new(1984, 10, 26), description: "Cyborg do futuro." },
  { title: "Alien",          rating: "R",  release_date: Date.new(1979, 5, 25),  description: "Terror espacial." },
  { title: "Toy Story",      rating: "G",  release_date: Date.new(1995, 11, 22), description: "Brinquedos com vida." },
  { title: "The Godfather",  rating: "R",  release_date: Date.new(1972, 3, 24),  description: "Máfia e família." },
  { title: "Inception",        rating: "PG-13", release_date: Date.new(2010,7,16),  description: "Sonhos dentro de sonhos." },
  { title: "Interstellar",     rating: "PG-13", release_date: Date.new(2014,11,7),  description: "Buracos de minhoca e amor." },
  { title: "The Dark Knight",  rating: "PG-13", release_date: Date.new(2008,7,18),  description: "O Cavaleiro das Trevas." },
  { title: "Pulp Fiction",     rating: "R",     release_date: Date.new(1994,10,14), description: "Narrativa não-linear." },
  { title: "Fight Club",       rating: "R",     release_date: Date.new(1999,10,15), description: "A primeira regra é..." },
  { title: "Forrest Gump",     rating: "PG-13", release_date: Date.new(1994,7,6),   description: "Chocolate e história dos EUA." },
  { title: "The Matrix",       rating: "R",     release_date: Date.new(1999,3,31),  description: "Pílula azul ou vermelha?" },
  { title: "Gladiator",        rating: "R",     release_date: Date.new(2000,5,5),   description: "Are you not entertained?" },
  { title: "Up",               rating: "PG",    release_date: Date.new(2009,5,29),  description: "Casa com balões." },
  { title: "Wall-E",           rating: "G",     release_date: Date.new(2008,6,27),  description: "Robô ecológico." },
  { title: "Spirited Away",    rating: "PG",    release_date: Date.new(2001,7,20),  description: "A viagem de Chihiro." },
  { title: "Parasite",         rating: "R",     release_date: Date.new(2019,5,30),  description: "Sátira social coreana." }
]
movies.each { |attrs| Movie.find_or_create_by!(title: attrs[:title]).update!(attrs) }

require "csv"
csv_path = Rails.root.join("db", "movies.csv")
if File.exist?(csv_path)
  CSV.foreach(csv_path, headers: true) do |row|
    attrs = row.to_h.symbolize_keys
    attrs[:release_date] = Date.parse(attrs[:release_date]) if attrs[:release_date].present?
    Movie.find_or_create_by!(title: attrs[:title]).update!(attrs)
  end
end
