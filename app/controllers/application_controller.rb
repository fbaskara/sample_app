class ApplicationController < ActionController::Base
  protect_from_forgery
  
  include SessionsHelper # making all controllers has this class
  
end
