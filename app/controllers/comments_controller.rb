class CommentsController < ApplicationController

 def create
   @comment = Commnet.new(comment_params)
   @post = @comment.post
   if @comment.save
     respond_to :js
   else
     flash[:danger] = "コメントに失敗しました"
   end
 end

 def destroy
   @comment = Commnet.find(params[:id])
   @post = @comment.post
   if @comment.destroy
     respond_to :js
   else
     falsh[:danger] = "コメントの削除に失敗しました"
   end
 end

 private
 def comment_params
   params.require(:comment).permit(:user_id, :post_id, :comment)
 end


end
