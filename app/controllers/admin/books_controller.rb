class Admin::BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"


  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to admin_books_path
    else
      render :new
    end
  end


  def show
    @book = Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :quantity, :price, :image)
  end
end
