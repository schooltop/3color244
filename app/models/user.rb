class User < ApplicationRecord
  include FileHandle

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  has_many :articles    

  IMPORT_COLUMNS = {
    item_no: 0,
    name: 1,
    birthday: 2,
    study_date: 3,
    title: 4,
    content: 5
  }   

  def self.save_from_hash(hash, current_employee)
      students = []
      message = "作品展示信息导入成功！"
      student = User.find_or_create_by(item_no: hash[:item_no].to_s)
      student.email = hash[:item_no].to_s
      student.name = hash[:name].to_s
      student.password = 11111111
      student.birthday = hash[:birthday].to_s
      student.study_date = hash[:study_date].to_s
      student.content = "生日：#{hash[:birthday]},学习时长：#{hash[:study_date]}"
      student.save

      article = Article.find_or_create_by(user_id: student.id)
      article.title = hash[:title].to_s
      article.content = hash[:content].to_s
      article.item_no = hash[:item_no].to_s
      article.category_id = 1
      article.vendor_id = 1
      article.activity_id = 1
      article.min_show = "#{student.name}小朋友，学习时长：#{hash[:study_date].to_s},作品：#{hash[:title].to_s}"
      article.cover_img = "/activities/#{student.item_no}.jpg" 
      article.save

      return students , message
  end
	
end