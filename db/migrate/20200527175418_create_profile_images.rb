class CreateProfileImages < ActiveRecord::Migration[5.2]
  def change
    create_table :profile_images do |t|
      t.text :_name
      t.string :image_id
      t.text :introduction
      t.integer :user_id

      t.timestamps
    end
  end
end
