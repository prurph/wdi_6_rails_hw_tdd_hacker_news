class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :points, default: 0
      t.references :user, index: true
      t.references :story, index: true
      t.timestamps
    end
  end
end
