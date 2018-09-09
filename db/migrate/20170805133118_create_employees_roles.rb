class CreateEmployeesRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :employees_roles ,:id => false do |t|
      t.references :role
      t.references :employee	
    end
  end
end
