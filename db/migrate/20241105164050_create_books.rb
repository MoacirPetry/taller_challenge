class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :publication_year

      t.timestamps
    end
  end
end
