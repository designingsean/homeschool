class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    if books = Book.create(book_params)
      flash[:success] = "Book saved"
    else
      flash[:error] = "Book not saved"
    end
    redirect_to controller: "logs", action: "new"
  end

  private

  def book_params
    params.require(:book).permit(:author, :title)
  end
end
