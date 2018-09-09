class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
	    t.string :name, comment: "名称"
      t.string :idcard_no, comment: "身份证号"
      t.string :item_no, comment: "序号"
      t.string :gps, comment: "位置"
      t.text   :gps_list, comment: "位置列表"
      t.string :city, comment: "城市"
      t.string :place, comment: "地区"
      t.string :address, comment: "地址"
      t.references :vendor, default: 1 , comment: '商家'
	    t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      ## Rememberable
      t.datetime :remember_created_at, comment: "加入时间"
      ## Trackable
      t.integer  :gender, default: 0, comment: "性别 0:男 1:女"
	    t.string   :mobile, limit: 30, comment: "手机"
      t.string   :mobile2, limit: 30, comment: "备用联系人电话"
      t.string   :qq, limit: 30, comment: "QQ"
      t.string   :office_tel, limit: 30, comment: "公司电话"
      t.date     :bod, comment: "生日"
      # Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      t.text     :content, comment: '简介'
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
