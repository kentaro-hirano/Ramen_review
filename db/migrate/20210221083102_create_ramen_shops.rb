class CreateRamenShops < ActiveRecord::Migration[5.0]
  def change
    create_table :ramen_shops do |t|
      t.string :name

      t.timestamps
    end
  end
end
