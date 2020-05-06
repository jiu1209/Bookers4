class BooksController < ApplicationController
def edit
    @book =Book.find(params[:id])
end

def update
	@book =Book.new(book_params)
	@book.user_id = current_user.id
	flash[:complete] = "You have creatad book successfully." 
    @book.save
	redirect_to book_path(@book.id)
end

def show	
	@book =Book.find(params[:id])
	@books = Book.page(params[:page])
	@users = User.all
	@user = current_user
end

def destroy
	 book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
end

def index
	@user = current_user
	@book = Book.new
	@books = Book.all
end

def create
	@book =Book.new(book_params)
	@book.user_id = current_user.id
    @book.save
    flash[:complete] = "You have creatad book successfully." 
	redirect_to book_path(@book.id)	
end

private
def book_params
    params.require(:book).permit(:title, :body)
end
end

