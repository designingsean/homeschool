class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :year, limit: 9, null: false
    end
  end
end
