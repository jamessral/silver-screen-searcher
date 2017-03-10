class ChangeOverviewToText < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :overview
    add_column :movies, :overview, :text
  end
end
