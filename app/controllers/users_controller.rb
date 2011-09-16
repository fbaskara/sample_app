class UsersController < ApplicationController
  def new
    @title = "Sign up"
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #puts 'successful save'
      # Handle a successful save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # redirect to a variable?
    else
      #puts 'save fail'
      #puts @user.errors.full_messages
      
      @title = "Sign up"
      render 'new'
    end
  end
end
