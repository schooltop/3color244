class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string  :name
      t.string  :mode
      t.integer :parent_id
      t.timestamps  	
    end
  end
end
