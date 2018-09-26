class AddVendorIdTocomments < ActiveRecord::Migration[5.1]
  def change
  	add_column :comments, :vendor_id, :integer, comment: '企业评论'
  	add_column :vendors, :latitude, :string, comment: 'gps经度'
  	add_column :vendors, :longitude, :string, comment: 'gps纬度'
  end
end
