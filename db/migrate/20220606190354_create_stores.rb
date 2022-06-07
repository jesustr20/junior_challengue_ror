class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.integer :priority
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
