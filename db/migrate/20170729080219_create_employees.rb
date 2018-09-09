class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
        t.string   "name"
	    t.string   "gender", comment: "性别" 
	    t.integer  "parent_id"
	    t.string   "mobile"
	    t.string   "office_tel", comment: "分机号" 
	    t.integer  "department_id", comment: "部门" 
	    t.datetime "created_at",                                      null: false
	    t.datetime "updated_at",                                      null: false
	    t.string   "email",                             default: "",  null: false
	    t.string   "encrypted_password",                default: "",  null: false
	    t.string   "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.integer  "sign_in_count",                     default: 0,   null: false
	    t.datetime "current_sign_in_at"
	    t.datetime "last_sign_in_at"
	    t.string   "current_sign_in_ip"
	    t.string   "last_sign_in_ip"
	    t.decimal  :discount, precision: 10, scale: 2, comment: "绩效"
	    t.integer  "employee_status", comment: "员工状态" 
	    t.datetime "joined_date", comment: "加入时间" 	
    end
  end
end
