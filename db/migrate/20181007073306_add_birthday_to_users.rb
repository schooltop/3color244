class AddBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :birthday, :string, comment: '生日'
  	add_column :users, :study_date, :string, comment: '学习时长'
  end
end
