class BooksController < ApplicationController
  before_action :set_book, only: [:update, :destroy, :show]
  before_action :set_publication_year, only: [:create, :update]

  def index
    @books = Book.all
    render json: @books
  end

  def create
    @book = Book.new(params_book.merge(publication_year: @publication_year))

    if @book.save
      redirect_to books_path, notice: "Book #{@book.title} registered!!"
    else
      render plain: "Something went wrong!"
    end
  end

  def update
    if @book.update(params_book.merge(publication_year: @publication_year))
      redirect_to books_path, notice: "Book updated!!"
    else
      render plain: "Something went wrong!"
    end
  end

  def destroy
    if @book.destroy
      render plain: "Book #{@book.title} deleted!!"
    else
      render plain: "Something went wrong!"
    end
  end

  def show
    render json: @book
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_publication_year
    @publication_year = DateTime.new(params[:publication_year].to_i, 1, 1)
  end

  def params_book
    params.require(:book).permit(:title, :author, :publication_year)
  end
end
