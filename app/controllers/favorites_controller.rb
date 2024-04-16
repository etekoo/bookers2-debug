class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.build(book: @book)
    favorite.save
    redirect_to book_path(@book)
  end
  
  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book: @book)
    favorite.destroy
    redirect_to book_path(@book)
  end
end