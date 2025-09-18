require "rails_helper"

RSpec.describe "Movies index", type: :request do
  it "sorts by title" do
    Movie.create!(title: "B", rating: "G", release_date: "2000-01-01")
    Movie.create!(title: "A", rating: "G", release_date: "2000-01-01")
    get "/movies", params: { sort_by: "title" }
  table = response.body[/<tbody>(.*?)<\/tbody>/m, 1]
  expect(table.index("A")).to be < table.index("B")
  end
end
