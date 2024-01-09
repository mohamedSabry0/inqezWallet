class CreatePaymentGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
