class BooksController < ApplicationController
def edit
    @book =Book.find(params[:id]) 
end

def update
	@book =Book.find(params[:id])
	@book.user_id = current_user.id

 if @book.update(book_params)
    flash[:complete] = "You have creatad book successfully." 
	redirect_to book_path(@book.id)
else
    render "edit"	
end
end

def show	
	@book =Book.find(params[:id])
	@books = Book.page(params[:page])
	@users = User.all
	@user = @book.user
end

def destroy
	 book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
end

def index
	@user = current_user
	@users =User.all
	@book = Book.new
	@books = Book.all
end

def create
	@book =Book.new(book_params)
    @book.user_id = current_user.id

if  @book.save
    flash[:complete] = "You have creatad book successfully." 
	redirect_to book_path(@book.id)	
else
	@books = Book.all
	@user = current_user
	render"index"
end
end

private
def book_params
    params.require(:book).permit(:title, :body)
end
end

