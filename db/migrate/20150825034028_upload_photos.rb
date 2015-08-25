class CreateUsersWithAttachments < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.attachment :avatar
    end

  def down
    drop_table :users
  end
end
