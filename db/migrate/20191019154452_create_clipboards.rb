class CreateClipboards < ActiveRecord::Migration[5.2]
  def change
    create_table :clipboards do |t|
      t.string :content
      t.string :device_name
      t.boolean :is_media

      t.timestamps
    end
  end
end
