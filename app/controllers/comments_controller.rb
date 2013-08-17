class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.question_id = params[:question_id]
    @comment.user = current_user
    @comment.save
    flash[:success] = t('controllers.comments.create.flash.success')
    redirect_to question_path(@comment.question)
  end
  
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    flash[:success] = t('controllers.comments.update.flash.success')
    redirect_to @answer.question
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to question_path(@question), :notice => t('controllers.comments.destroy.flash.success')
  end
  
  private
  
  def comment_params
      params.require(:comment).permit(:body, :user_id, :question_id)
  end
end
