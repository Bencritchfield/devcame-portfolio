class CommentsController < ApplicationController
	before_action :set_blog, only: [:create]
	def create
		@comment = current_user.comments.build(comment_params)
			puts ["hello world", @blog.id, "user", current_user]
		
	end

	private

	def set_blog
	  @blog = Blog.friendly.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end
end
