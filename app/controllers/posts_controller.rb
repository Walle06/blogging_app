class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
	 @post = current_user.posts.create(params.require(:post).permit(:title, :user, :content))
  	  if @post.save
   	    redirect_to root_path
  	  else
    	render "new"
  	  end
	end
     def destroy
       @post = Post.find(params[:id])
       @post.destroy
     
       respond_to do |format|
         format.html { redirect_to(posts_url) }
         format.xml  { head :ok }
       end
     end

end