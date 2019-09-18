class CreateLibraryRecomendations < ActiveRecord::Migration[6.0]
  def change
    create_table :library_recomendations do |t|
      t.integer :book_id
      t.integer :order, default: 999
    end
  end
end
