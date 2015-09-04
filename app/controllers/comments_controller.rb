class CommentsController < ApplicationController
  def create

    @lesson  = Lesson.find(params[:lesson_id])
    @comment = @lesson.comments.build(comment_params)
    @comment.name = current_user.email if user_signed_in?
    if @comment.save
      redirect_to @lesson, notice: 'You comment successfully saved.'
    else
      render 'lessons/show'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end