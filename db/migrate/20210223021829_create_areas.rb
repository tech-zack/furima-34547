class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :city
      t.string :address
      t.string :building
      t.string :postal_code
      t.string :phone_number
      t.integer  :delivery_source_id
      t.references :order, foreign_key: true
      
      t.timestamps
    end
  end
end
