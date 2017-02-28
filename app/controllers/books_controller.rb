class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def add_to_cart
    @book = Book.find(params[:id])
    if !current_cart.books.include?(@book)
      current_cart.add_book_to_cart(@book)
      flash[:notice] = "成功加入购物车"
      flash[:notice] = "你已经成功将 #{@book.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end
end
