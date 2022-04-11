class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.string :image_name, null: false, default: "default_icon.jpeg"
      t.string :introduce, default: ""
      t.integer :user_id, null: false, unique: true

      t.timestamps
    end
  end
end
