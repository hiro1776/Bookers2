class BooksController < ApplicationController
	 
  def index
    @users = User.all
    @user = current_user
    @books= Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @books = Book.all
  end

  def edit
    @book= Book.find(params[:id])
  end
  def destroy
    @book = Book.find(params[:id])
      if @book.destroy
        flash[:notice] = ""
        redirect_to books_path
      end
  end
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "You have created book successfully"
        redirect_to book_path(@book.id)
      else
        @books= Book.all
        @user= current_user
        render 'index'
      end
  end
  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
          flash[:notice] = "Book was successfully created"
        redirect_to book_path(@book.id)
      else
        render 'edit'
      end
  end
  private 
    def book_params
      params.require(:book).permit(:title, :body)
    end
    #def profile_image_params
      #params.require(:profile_image).permit(user_image, :image, :capion)
    #end


end
