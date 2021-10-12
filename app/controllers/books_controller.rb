class BooksController < ApplicationController

  def index
    @book=Book.new
    @books=Book.all
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:create]="投稿完了しました"
      redirect_to books_path
    else
      @books=Book.all
      render :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end