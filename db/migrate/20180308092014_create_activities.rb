class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.string  :name, comment: '活动名称'
      t.references :category, comment: '分类'
      t.string  :activity_mod, comment: '活动模型'
      t.references :vendor, default: 1 , comment: '商家'
	    t.integer :status, default: 0, comment: '-1删除,0默认状态,1开启,2完结'
	    t.string  :base_tags, comment: '固定标签'
	    t.string  :tags, comment: '自定义标签'
	    t.text    :describe, comment: '活动描述'
      t.text    :summary, comment: '活动总结'
      t.integer :initiator, comment: '发起人'
      t.decimal :expected_cost, precision: 10, scale: 2, comment: '预计费用'
      t.decimal :actual_cost, precision: 10, scale: 2, comment: '实际费用'
      t.integer :effect, comment: '是否达到预期效果'
	    t.date    :expiry_on, comment: '有效日期'
	    t.timestamps 	
    end
  end
end