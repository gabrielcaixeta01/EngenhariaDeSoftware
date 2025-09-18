require "rails_helper"

RSpec.describe Movie, type: :model do
  it "requires title and release_date and valid rating" do
    m = Movie.new(title: "", rating: "X", release_date: nil)
    expect(m).not_to be_valid
    expect(m.errors[:title]).to be_present
    expect(m.errors[:rating]).to be_present
    expect(m.errors[:release_date]).to be_present
  end
end
