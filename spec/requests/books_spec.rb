require 'rails_helper'

RSpec.describe "Books", type: :request do
  let!(:book) { Book.create(title: "Sample Book", author: "Author Name", publication_year: DateTime.new(1990, 1, 1)) }

  describe "GET /index" do
    it "returns a successful response and includes books" do
      get books_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Sample Book")
    end
  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     let(:valid_params) do
  #       { book: { title: "New Book", author: "New Author", publication_year: 2024 } }
  #     end

  #     it "creates a new book and redirects" do
  #       expect {
  #         post books_path, params: valid_params
  #       }.to change(Book, :count).by(1)

  #       expect(response).to redirect_to(books_path)
  #       follow_redirect!

  #       expect(response.body).to include("Book New Book registered!!")
  #     end
  #   end

  #   context "with invalid parameters" do
  #     let(:invalid_params) do
  #       { book: { title: "", author: "", publication_year: "" } }
  #     end

  #     it "does not create a new book and renders an error message" do
  #       expect {
  #         post books_path, params: invalid_params
  #       }.not_to change(Book, :count)

  #       expect(response.body).to include("Something went wrong!")
  #     end
  #   end
  # end

  describe "GET /show" do
    it "returns a successful response for a specific book" do
      get book_path(book)
      expect(response).to have_http_status(:success)
      expect(response.body).to include(book.title)
    end
  end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:updated_params) do
  #       { book: { title: "Updated Book", author: "Updated Author", publication_year: 1995 } }
  #     end

  #     it "updates the book and redirects" do
  #       patch book_path(book), params: updated_params
  #       book.reload

  #       expect(book.title).to eq("Updated Book")
  #       expect(book.publication_year.year).to eq(1995)
  #       expect(response).to redirect_to(books_path)
  #       follow_redirect!

  #       expect(response.body).to include("Book updated!!")
  #     end
  #   end

  #   context "with invalid parameters" do
  #     let(:invalid_params) do
  #       { book: { title: "", author: "", publication_year: "", } }
  #     end

  #     it "does not update the book and renders an error message" do
  #       patch book_path(book), params: invalid_params
  #       expect(response.body).to include("Something went wrong!")
  #     end
  #   end
  # end

  describe "DELETE /destroy" do
    it "deletes the book and returns a success message" do
      expect {
        delete book_path(book)
      }.to change(Book, :count).by(-1)

      expect(response.body).to include("Book #{book.title} deleted!!")
    end
  end
end
