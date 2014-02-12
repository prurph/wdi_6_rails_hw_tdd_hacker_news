class VotesController < ApplicationController
  # before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_action :set_votable

  def new
    @vote = Vote.new
  end

  def upvote
    if user_signed_in?
      @vote = @votable.votes.find_or_create_by(user_id: current_user.id)
    else
      flash[:alert] = "Please log in to vote"
      return redirect_to new_user_session_path
    end

    if @vote.update_attributes(value: params[:value])
      flash[:notice] = "Upvoted!"
      # redirect_to @votable.class
    else
      flash[:alert] = @vote.errors.full_messages.join(", ")
      # redirect_to @votable.class || @votable.story
    end
    redirect_to :back
  end

  def downvote
    if user_signed_in?
      @vote = @votable.votes.find_or_create_by(user_id: current_user.id)
    else
      flash[:alert] = "Please log in to vote"
      return redirect_to new_user_session_path
    end

    if @vote.update_attributes(value: params[:value])
      flash[:notice] = "Downvoted!"
      # redirect_to @votable.class
    else
      flash[:alert] = @vote.errors.full_messages.join(", ")
      # redirect_to @votable.class
    end
    redirect_to :back
  end

  private
  def set_votable
    @votable = params[:votable].classify.constantize.find(votable_id)
  end

  def votable_id
    params[(params[:votable] + "_id").to_sym]
  end
end
