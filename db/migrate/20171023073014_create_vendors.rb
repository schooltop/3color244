class CreateVendors < ActiveRecord::Migration[5.1]
  def change
    create_table :vendors do |t|
      t.string   :parent_name, comment: "总公司"
      t.string   :name, comment: "公司名称"
      t.integer  :parent_id, comment: "parent_id"
      t.references :employee, default: 1 , comment: '管理账号'
      t.integer :bd_id, default: 1 , comment: '代理商'
      t.integer :am_id, default: 1 , comment: '服务员工'
      t.integer :cs_id, default: 1 , comment: '客服'
      t.string   :mobile, limit: 30, comment: "联系人电话"
      t.string   :office_tel, limit: 30, comment: "公司电话"
      t.string   :email , comment: "邮箱"
      t.string   :website , comment: "网址"
      t.text     :content, comment: "简介"
      t.string   :gps, comment: "位置"
      t.string   :city, comment: "城市"
      t.string   :place, comment: "地区"
      t.string   :address, comment: "地址"
      t.string   :cover_img, comment: "logo"
      t.string   :cover_img, comment: "封面"
      t.string   :contract, comment: "合同"
      t.decimal  :discount, precision: 10, scale: 2, comment: "折扣"
      t.references  :category, comment: "公司分类"
      t.integer  :view_count, comment: "关注数量"
      t.integer  :seq, default: 10, comment: "排序"
      t.string   :tag	, comment: "标签"
      t.timestamps
    end
  end
end
