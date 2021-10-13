class UsersController < ApplicationController
  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books

    @favorites_count=0
    @books.each do |book|
      @favorites_count+=book.favorites.count
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user==current_user
      render:edit
    else
      redirect_to books_path
    end
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image)
  end

end
