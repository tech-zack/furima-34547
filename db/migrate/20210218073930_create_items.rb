class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :delivery_source_id, null: false
      t.integer :delivery_date_id, null: false
      t.integer :product_price, null: false
      t.text :description , null: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
