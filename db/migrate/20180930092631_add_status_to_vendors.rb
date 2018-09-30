class AddStatusToVendors < ActiveRecord::Migration[5.1]
  def change
  	add_column :vendors, :status, :integer, default:0, comment: '0默认，1审核通过，2合同合作'
  	add_column :vendors, :log_img, :string, comment: 'logo'
  end
end
