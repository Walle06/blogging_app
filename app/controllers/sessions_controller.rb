class SessionsController < ApplicationController

  #route for login form
	def new
	end


   #processes data from login form
	def create
		# @user = User.where(email: params[:email]).first 
  #         if @user && @user.password == params[:password]
  #           session[:user_id] = @user.id   
  #            redirect_to home_path 
  #       end  
  #     end
  #   end
	

    user = User.find_by_email(params[:email])   
    if user && user.authenticate(params[:password])     
      session[:user_id] = user.id     
      redirect_to root_path, :notice => "Welcome back, #{user.email}"  
    else     
      flash[:alert] = "Invalid email or password"
      render "new"
    end
  end
end