class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.integer :price
      t.string :description
      t.string :state, default: 'Pendiente'
      t.references :client, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
