# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180930092631) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "活动名称"
    t.bigint "category_id", comment: "分类"
    t.string "activity_mod", comment: "活动模型"
    t.bigint "vendor_id", default: 1, comment: "商家"
    t.integer "status", default: 0, comment: "-1删除,0默认状态,1开启,2完结"
    t.string "base_tags", comment: "固定标签"
    t.string "tags", comment: "自定义标签"
    t.text "describe", comment: "活动描述"
    t.text "summary", comment: "活动总结"
    t.integer "initiator", comment: "发起人"
    t.decimal "expected_cost", precision: 10, scale: 2, comment: "预计费用"
    t.decimal "actual_cost", precision: 10, scale: 2, comment: "实际费用"
    t.integer "effect", comment: "是否达到预期效果"
    t.date "expiry_on", comment: "有效日期"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_activities_on_category_id"
    t.index ["vendor_id"], name: "index_activities_on_vendor_id"
  end

  create_table "activities_pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "activity_id"
    t.bigint "picture_id"
    t.index ["activity_id"], name: "index_activities_pictures_on_activity_id"
    t.index ["picture_id"], name: "index_activities_pictures_on_picture_id"
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "content"
    t.text "min_show"
    t.string "cover_img"
    t.bigint "category_id", comment: "分类"
    t.bigint "activity_id", comment: "活动"
    t.integer "view_count"
    t.bigint "vendor_id", default: 1, comment: "商家"
    t.bigint "user_id", default: 1, comment: "作者"
    t.integer "seq", default: 10, comment: "排序"
    t.integer "mp3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_articles_on_activity_id"
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
    t.index ["vendor_id"], name: "index_articles_on_vendor_id"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "attachment_entity_type", limit: 64
    t.integer "attachment_entity_id"
    t.string "path"
    t.string "name"
    t.string "content_type"
    t.integer "file_size"
    t.string "created_by", limit: 64
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_entity_id"], name: "attachments_entity_idx"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "mode"
    t.integer "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text "content"
    t.integer "article_id"
    t.integer "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vendor_id", comment: "企业评论"
  end

  create_table "employees", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "gender", comment: "性别"
    t.integer "parent_id"
    t.string "mobile"
    t.string "office_tel", comment: "分机号"
    t.integer "department_id", comment: "部门"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.decimal "discount", precision: 10, scale: 2, comment: "绩效"
    t.integer "employee_status", comment: "员工状态"
    t.datetime "joined_date", comment: "加入时间"
  end

  create_table "employees_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "role_id"
    t.bigint "employee_id"
    t.index ["employee_id"], name: "index_employees_roles_on_employee_id"
    t.index ["role_id"], name: "index_employees_roles_on_role_id"
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "action_tag"
    t.string "controller_tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permissions_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "permission_id"
    t.bigint "role_id"
    t.index ["permission_id"], name: "index_permissions_roles_on_permission_id"
    t.index ["role_id"], name: "index_permissions_roles_on_role_id"
  end

  create_table "pictures", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.text "content", comment: "简介"
    t.integer "category_id", comment: "分类"
    t.integer "user_id", comment: "作者"
    t.integer "vendor_id", default: 1, comment: "商家"
    t.integer "employee_id", comment: "管理人员"
    t.integer "view_count", comment: "访问次数"
    t.integer "nice_count", comment: "投票数"
    t.integer "mp3", comment: "语音介绍"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pictures_on_category_id"
    t.index ["employee_id"], name: "index_pictures_on_employee_id"
    t.index ["user_id"], name: "index_pictures_on_user_id"
    t.index ["vendor_id"], name: "index_pictures_on_vendor_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "parent_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", comment: "名称"
    t.string "idcard_no", comment: "身份证号"
    t.string "item_no", comment: "序号"
    t.string "gps", comment: "位置"
    t.text "gps_list", comment: "位置列表"
    t.string "city", comment: "城市"
    t.string "place", comment: "地区"
    t.string "address", comment: "地址"
    t.bigint "vendor_id", default: 1, comment: "商家"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "remember_created_at", comment: "加入时间"
    t.integer "gender", default: 0, comment: "性别 0:男 1:女"
    t.string "mobile", limit: 30, comment: "手机"
    t.string "mobile2", limit: 30, comment: "备用联系人电话"
    t.string "qq", limit: 30, comment: "QQ"
    t.string "office_tel", limit: 30, comment: "公司电话"
    t.date "bod", comment: "生日"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.text "content", comment: "简介"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["vendor_id"], name: "index_users_on_vendor_id"
  end

  create_table "vendors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "parent_name", comment: "总公司"
    t.string "name", comment: "公司名称"
    t.integer "parent_id", comment: "parent_id"
    t.bigint "employee_id", default: 1, comment: "管理账号"
    t.integer "bd_id", default: 1, comment: "代理商"
    t.integer "am_id", default: 1, comment: "服务员工"
    t.integer "cs_id", default: 1, comment: "客服"
    t.string "mobile", limit: 30, comment: "联系人电话"
    t.string "office_tel", limit: 30, comment: "公司电话"
    t.string "email", comment: "邮箱"
    t.string "website", comment: "网址"
    t.text "content", comment: "简介"
    t.string "gps", comment: "位置"
    t.string "city", comment: "城市"
    t.string "place", comment: "地区"
    t.string "address", comment: "地址"
    t.string "cover_img", comment: "封面"
    t.string "contract", comment: "合同"
    t.decimal "discount", precision: 10, scale: 2, comment: "折扣"
    t.bigint "category_id", comment: "公司分类"
    t.integer "view_count", comment: "关注数量"
    t.integer "seq", default: 10, comment: "排序"
    t.string "tag", comment: "标签"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude", comment: "gps经度"
    t.string "longitude", comment: "gps纬度"
    t.integer "status", default: 0, comment: "0默认，1审核通过，2合同合作"
    t.string "log_img", comment: "logo"
    t.index ["category_id"], name: "index_vendors_on_category_id"
    t.index ["employee_id"], name: "index_vendors_on_employee_id"
  end

end
