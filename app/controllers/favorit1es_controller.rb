class Favorit1esController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.new(book_id: book.id)
    favorit1e.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.find_by(book_id: book.id)
    favorit1e.destroy
    redirect_to request.referer
  end
end
