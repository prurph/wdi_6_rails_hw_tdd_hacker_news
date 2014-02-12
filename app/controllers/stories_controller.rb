class StoriesController < ApplicationController
  def index
    @stories = Story.top_30
  end

  def show
    @story = get_story
    @comment = Comment.new
  end

  def new
    if user_signed_in?
      @story = Story.new
    else
      flash[:alert] = "Please log in to submit"
      redirect_to stories_path
    end
  end

  def create
    new_story = Story.new(story_params)
    new_story.user_id = current_user.id
    if new_story.save
      flash[:notice] = "Article submitted"
      redirect_to root_path
    else
      flash[:alert] = new_story.errors.full_messages.join(", ")
      redirect_to stories_path
    end
  end

  private
  def get_story
    Story.find(params[:id])
  end
  def story_params
    params.require(:story).permit(:title, :description, :link)
  end
end
