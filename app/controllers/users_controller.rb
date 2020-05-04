class UsersController < ApplicationController
def index
	@book=Book.new
	@books =Book.all
	@user =User.new
	@users = User.all

end

def show
	@user = User.find(params[:id])
	@users = User.all
	@book=Book.new
	@books =Book.all
end
end
