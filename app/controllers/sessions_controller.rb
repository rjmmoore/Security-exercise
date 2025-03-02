class SessionsController < ApplicationController
  def new
  end
  
  def create
    # TODO: authenticate user
      @user = User.find_by({ "email" => params["email"] })
    
      if @user && BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome back, #{@user["first_name"]}!"
        redirect_to "/posts"
      else
        flash["notice"] = "Invalid email or password."
        redirect_to "/login"
      end
    flash["notice"] = "Nope."
    redirect_to "/login"
  end
end

def destroy
  session["user_id"] = nil
  flash["notice"] = "Goodbye!"
  redirect_to "/login"
end