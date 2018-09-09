class CreateActivitiesPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :activities_pictures do |t|
      t.references :activity
      t.references :picture
    end
  end
end
