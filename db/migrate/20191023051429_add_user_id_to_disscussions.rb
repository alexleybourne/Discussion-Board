class AddUserIdToDisscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :disscussions, :user_id, :integer
    add_index :disscussions, :user_id
  end
end
