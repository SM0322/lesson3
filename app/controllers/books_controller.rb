class BooksController < ApplicationController
before_action :ensure_current_book, {only: [:edit, :update]}

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @book_page = Book.page(params[:page])
    @book = Book.new
    @books = Book.all
  end

  def show
    @books = Book.new
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @book_comments = @book.book_comments
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_current_book
   @book = Book.find(params[:id])
   if current_user.id != @book.user_id
     redirect_to books_path
   end
  end 
  
end
