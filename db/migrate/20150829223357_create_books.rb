class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author, null: false
      t.string :title, null: false
    end
  end
end
