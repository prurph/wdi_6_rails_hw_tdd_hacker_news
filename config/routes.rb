HackerNews::Application.routes.draw do

  devise_for :users

  post '/stories/:story_id/upvote', to: 'votes#upvote', as: 'story_upvote',
    defaults: {votable: 'story', value: 1 }
  post '/stories/:story_id/downvote', to: 'votes#downvote', as: 'story_downvote',
    defaults: {votable: 'story', value: -1 }

  post '/stories/:story_id/comments/:comment_id/upvote', as: 'story_comment_upvote',
    to: 'votes#upvote', defaults: {votable: 'comment', value: 1 }
  post '/stories/:story_id/comments/:comment_id/downvote', as: 'story_comment_downvote',
    to: 'votes#downvote', defaults: {votable: 'comment', value: -1 }

  resources :stories do
    resources :comments do
    end
  end

  root 'stories#index'

end
