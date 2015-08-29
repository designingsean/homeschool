class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.references :student, index: true, foreign_key: true, null: false
      t.references :year, index: true, foreign_key: true, null: false
      t.references :grade, index: true, foreign_key: true, null: false
    end
  end
end
