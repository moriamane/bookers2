class UsersController < ApplicationController

  def new
    @book = Book.new
  end
  
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  
  def create
    @user = User.find(current_user.id)
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @user, notice: 'You have created book successfully.'
    else
      render :index
    end
  end
  
  
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
end
