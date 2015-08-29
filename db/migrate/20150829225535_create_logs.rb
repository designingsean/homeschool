class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :record, index: true, foreign_key: true, null: false
      t.references :subject, index: true, foreign_key: true, null: false
      t.references :teacher, index: true, foreign_key: true, null: false
      t.date :date, null: false
      t.text :description
      t.references :book, index: true, foreign_key: true
    end
  end
end
