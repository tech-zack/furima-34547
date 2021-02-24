class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :city                           ,null: false
      t.string :address                        ,null: false
      t.string :building
      t.string :postal_code                    ,null: false
      t.string :phone_number                   ,null: false
      t.integer  :delivery_source_id           ,null: false
      t.references :order, foreign_key: true   ,null: false
      
      t.timestamps
    end
  end
end
