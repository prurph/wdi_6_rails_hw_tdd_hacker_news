class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :link
      t.text :description
      t.text :title

      t.timestamps
    end
  end
end
