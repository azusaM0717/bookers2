class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    flash[:notice] ="User was successfully updated."
    redirect_to user_path(@user.id)
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
