class BooksController < ApplicationController

  def index
    @book=Book.new
    @books=Book.all
    @user=User.find(current_user.id)
  end

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      flash[:create]="投稿完了しました"
      redirect_to books_path
    else
      @books=Book.all
      render :index
    end
  end

  def show
    @book=Book.new
    @select_book=Book.find(params[:id])
    @user=User.find(current_user.id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end