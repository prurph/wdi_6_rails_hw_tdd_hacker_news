class StoriesController < ApplicationController
  def index
    @stories = Story.order(created_at: :desc)
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def upvote
    @story = Story.find(params[:id])
    @story.update_attributes(points: @story.points + 1)
    redirect_to stories_path
  end

  def create
    new_story = Story.new(story_params)
    new_story.user_id = current_user.id
    if new_story.save
      flash[:notice] = "Article submitted"
      redirect_to root_path
    else
      flash[:error] = new_story.errors.full_messages.join(", ")
      render :new
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :description, :link)
  end
end
