class Favorit1esController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.new(book_id: book.id)
    favorit1e.save
    redirect_back(fallback_location: root_path)  #ここを削除！
  end

  def destroy
    book = Book.find(params[:book_id])
    favorit1e = current_user.favorit1es.find_by(book_id: book.id)
    favorit1e.destroy
    redirect_back(fallback_location: root_path)  #ここを削除！
  end
end
