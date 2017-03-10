class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
      t.string :params, null: false
      t.timestamps
    end
  end
end
