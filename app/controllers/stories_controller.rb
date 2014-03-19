class StoriesController < ApplicationController
  def index
    @stories = Story.includes(:votes).top_30
    @user_vote = map_votable_to_user_votes(@stories)
  end

  def show
    @story = get_story
    @comment = Comment.new
    @story_comments = @story.comments.includes(:user, :votes).order(:created_at)
    @user_comm_vote = map_votable_to_user_votes(@story_comments)
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

  def map_votable_to_user_votes(votable_array)
    if user_signed_in?
      user_votes = votable_array.map do |votable_thing|
        votable_thing.user_voted_value(current_user.id)
      end
      user_votes.flatten!
    else
      user_votes = Array.new(votable_array.length, 0)
    end
    user_votes
  end
end
