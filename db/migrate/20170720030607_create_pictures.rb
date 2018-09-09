class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string     :name
      t.text       :content, comment: '简介' 
      t.references :category, comment: '分类'
      t.references :user , comment: '作者'
      t.references :vendor, default: 1 , comment: '商家'
      t.references :employee , comment: '管理人员' 
      t.integer    :view_count , comment: '访问次数' 
      t.integer    :nice_count , comment: '投票数' 
      t.integer    :mp3 , comment: '语音介绍'
      t.timestamps	
    end
  end
end
