class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :color
      t.float :price
      t.boolean :four_wheel_drive
      t.integer :make_id
      t.integer :user_id

      t.timestamps
    end
  end
end
