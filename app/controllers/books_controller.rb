class BooksController < ApplicationController

  def index
    @books = Book.all
    # render plain: "OK"
    render json: @books
  end

  def new
    @book = Book.new()
  end
end
