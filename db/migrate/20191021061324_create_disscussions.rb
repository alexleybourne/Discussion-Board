class CreateDisscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :disscussions do |t|
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
