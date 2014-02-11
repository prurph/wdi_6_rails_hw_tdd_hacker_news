class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @story = get_story
  end

  def create
    comment = Comment.new(comment_params)
    story = get_story
    comment.story_id = story.id
    comment.user_id = current_user.id

    if comment.save
      flash[:notice] = "Comment created"
      story.comments << comment
      redirect_to story
    else
      flash[:error] = comment.errors.full_messages.join(", ")
      render :new
    end
  end

  private
  def get_story
    Story.find(params[:story_id])
  end
  def comment_params
    params.require(:comment).permit(:body)
  end
end
