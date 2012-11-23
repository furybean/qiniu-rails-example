class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.integer :user_id
      t.string :file_key
      t.string :file_name
      t.integer :file_size
      t.string :file_type

      t.timestamps
    end
  end
end
