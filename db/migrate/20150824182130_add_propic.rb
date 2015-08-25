class AddPropic < ActiveRecord::Migration
  def up
    add_column :users, :profile_pic, :string
  end
  
  def down
    remove_column :users, :profile_pic, :string 
  end
end
