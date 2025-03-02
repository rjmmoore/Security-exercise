class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    @post = Post.new
    @post["body"] = params["body"]
    @post["image"] = params["image"]
    # TODO: assign logged-in user as user that created the post
    def new
      if @current_user
        # Show the form
      else
        flash["notice"] = "You must be logged in to create a post."
        redirect_to "/login"
      end
    end
    @post.save
    redirect_to "/posts"
  end
end

def create
  if @current_user
    @post = Post.new
    @post["content"] = params["content"]
    @post["user_id"] = @current_user["id"]
    @post.save
    redirect_to "/posts"
  else
    flash["notice"] = "You must be logged in to create a post."
    redirect_to "/login"
  end
end
