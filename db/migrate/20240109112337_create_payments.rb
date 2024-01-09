class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :name
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.decimal :amount, precision: 12, scale: 3

      t.timestamps
    end
  end
end
