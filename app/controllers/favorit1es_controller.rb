class Favorit1esController < ApplicationController
before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.new(book_id: @book.id)
    favorit1e.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.find_by(book_id: @book.id)
    favorit1e.destroy
  end
end
