class ModifyPosts < ActiveRecord::Migration
  
def up
    add_column :posts, :user_id, :integer
    remove_column :posts, :username, :string
  end
  
  def down
    add_column :posts, :username, :string
    remove_column :posts, :user_id, :integer 
  end
end