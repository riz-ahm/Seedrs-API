class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.string :image_url, null: true
      t.decimal :percentage_raised, precision: 7, scale: 2, null: false
      t.decimal :target_amount, precision: 19, scale: 2, null: false
      t.string :sector, null: false
      t.string :country, null: false
      t.decimal :investment_multiple, precision: 19, scale: 2, null: false

      t.timestamps
    end
  end
end
