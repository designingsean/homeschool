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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      redirect_to controller: "logs", action: "index"
    else
      render "edit"
    end
  end

  private

  def book_params
    params.require(:book).permit(:author, :title, :subject_id)
  end
end
