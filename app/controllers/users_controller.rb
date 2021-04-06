class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path # @user here is a shorthand for: user_path(@user.id).  Shows the user profile.
      # The trick here is that the view page gets passed the instance variables from your current controller action.
      # So lets say that you tried to #create a Post and stored it to @post but it failed to save.
      # You then rendered the "#new" actions view
      # and that view will receive the @post you were just working with
      # in the #create action.
    else
      # p @user.errors # show errors on console
      render :new

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path(@user.id) # or just "redirect_to edit_user_path" or "@user"
    else
      #  p @user.errors # show errors on console
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
