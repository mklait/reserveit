class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :email
      t.string :cuisine
      t.float :price
      t.float :rating	
      t.timestamps
    end
  end
end
