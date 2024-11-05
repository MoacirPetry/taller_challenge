require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Validates' do
    it 'is valid' do
      title = Faker::Book.title
      author = Faker::Book.author
      publication_year = 10.year.ago
      book = Book.create(title: title, author: author, publication_year: publication_year)
      expect(book).to be_valid
    end
  end
end
