class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string  :title
	  t.text    :content
      t.string  :cover_img
      t.references :category, comment: '分类'
      t.references :activity, comment: '活动' 
      t.integer :view_count
      t.references :vendor, default: 1 , comment: '商家'
      t.integer :seq, default: 10, comment: '排序' 
      t.integer :mp3
      t.timestamps
    end
  end
end
