# db/seeds.rb
movies = [
  { title: "The Terminator", rating: "R",  release_date: Date.new(1984, 10, 26), description: "Cyborg do futuro." },
  { title: "Alien",          rating: "R",  release_date: Date.new(1979, 5, 25),  description: "Terror espacial." },
  { title: "Toy Story",      rating: "G",  release_date: Date.new(1995, 11, 22), description: "Brinquedos com vida." },
  { title: "The Godfather",  rating: "R",  release_date: Date.new(1972, 3, 24),  description: "Máfia e família." }
]
movies.each { |attrs| Movie.find_or_create_by!(title: attrs[:title]).update!(attrs) }
