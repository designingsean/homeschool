class AddStudentToLogs < ActiveRecord::Migration
  def change
    add_reference(:logs, :student, index: true, foreign_key: true, null: false, default: 1)
  end
end
