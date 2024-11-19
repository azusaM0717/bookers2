class BooksController < ApplicationController
  def new
    @book = Book.new(book_params)
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] ="Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render 'books/index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book =Book.find(params[:id])
      if @book.update(book_params)
      flash[:notice] ="Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
end
