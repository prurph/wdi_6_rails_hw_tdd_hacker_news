class AddPointsToStories < ActiveRecord::Migration
  def change
    add_column :stories, :points, :integer, default: 0
  end
end
