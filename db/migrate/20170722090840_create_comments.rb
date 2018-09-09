class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text   "content"
      t.integer "article_id"
      t.integer "picture_id"
      t.timestamps	
    end
  end
end
