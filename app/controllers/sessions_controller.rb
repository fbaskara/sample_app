class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      flash.now[:error] = "Dude, Invalid email/password combination here"
      @title = "Sign in"
      render 'new'
    else
      # sign the user in and redirect to the user's show page
      sign_in user 
        # sign_in is a built in method? 
        # no, this method will be in SessionHelper class
      redirect_to user
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end

end
