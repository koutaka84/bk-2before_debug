class CommentsController < ApplicationController
	before_action :authenticate_user!

def create
	@book = Book.find(params[:book_id])
	@comment = current_user.comments.new(comment_params)
	@comment.book_id = @book.id
	@comment.save
	redirect_to book_path(@book)
end

def destroy
	comment = current_user.comments.find(params[:id])
	comment.destroy

	redirect_to [:book, {id:params[:book_id]}]
end

private

def comment_params
	params.require(:comment).permit(:body)
	end
end

