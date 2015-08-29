class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first, limit: 20, null: false
      t.string :last, limit: 20, null: false
    end
  end
end
