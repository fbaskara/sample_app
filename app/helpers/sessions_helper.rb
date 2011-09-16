module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    current_user = user 
    # current_user is SessionsHelper built in varible? no
  end
  
  def current_user=(user) 
    # hm, what does '=' mean? 
    # meaning it is an assignment function
    # meaning calling this function assigns value
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
    # ||= means 'or-equals' assignment
    # it assigns *only if* @current_user is undefined
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def sign_out
    cookies.delete(:remember_token)
    current_user = nil
  end
  
  private
    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
      # what does * mean?
    end
    
    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
