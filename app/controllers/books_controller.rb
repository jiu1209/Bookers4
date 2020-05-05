class BooksController < ApplicationController
def edit
    @book =Book.find(params[:id])
end

def update
	@book =Book.new(book_params)
    @book.save
	redirect_to book_path
end

def show	
	@book =Book.find(params[:id])
	@books = Book.page(params[:page])
	@users = User.all
	@user =User.new
end

def destroy
	 book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
end

def index
	@book = Book.new
	@books = Book.all
	@user =User.new
	@users = User.all
end

def create
	@book =Book.new(book_params)
	@book.user_id = current_user.id
    @book.save
	redirect_to book_path(@book.id)
end

private
def book_params
    params.require(:book).permit(:title, :body)
end
end

