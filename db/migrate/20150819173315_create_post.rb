class CreatePost < ActiveRecord::Migration
   def up
    create_table :posts do |t|
      t.string :username
      t.string :picture
      t.string :caption
    end
  end
  def down
    drop_table :posts
  end
end
