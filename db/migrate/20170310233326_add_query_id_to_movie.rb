class AddQueryIdToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :query_id, :integer
  end
end
