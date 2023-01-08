class UsersController < ApplicationController
before_action :ensure_current_user, {only: [:edit, :update]}

  def index
    @users = User.all
    @books = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page])
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def edit
    @user = User.find(params[:id])  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
def ensure_current_user
  if current_user.id != params[:id].to_i
    redirect_to user_path(current_user.id)
  end
end
end