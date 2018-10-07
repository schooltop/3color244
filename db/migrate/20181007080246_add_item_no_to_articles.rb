class AddItemNoToArticles < ActiveRecord::Migration[5.1]
  def change
  	add_column :articles, :item_no, :string, comment: '作品号'
  end
end
