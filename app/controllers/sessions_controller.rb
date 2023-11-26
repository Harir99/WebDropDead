# controllers/sessions_controller.rb
class SessionsController < ApplicationController
    def new
      # Render the sign-in form
    end
  
    def create
      user = User.find_by(email: params[:session][:email])
    
      if user && user.authenticate(params[:session][:password])
        # Sign in the user and create a session
        session[:user_id] = user.id
        redirect_to play_path # Redirect to the "play" action/page
      else
        flash.now[:error] = "Invalid email or password"
        render :new
      end
    end
    
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path # Redirect to the homepage or another appropriate page
    end
  end
  