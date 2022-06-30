class CreateInvestments < ActiveRecord::Migration[7.0]
  def change
    create_table :investments do |t|
      t.decimal :amount, precision: 19, scale: 2, null: false
      t.string :investor_name, null: false

      t.timestamps
    end
  end
end
