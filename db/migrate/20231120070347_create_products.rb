class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end
