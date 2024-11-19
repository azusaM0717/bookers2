class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
      redirect_to root_path
    else
      render :new
    end
  end


  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end
  end

  def update
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to users_path
    end

    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] ="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'users/edit'
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end
end
