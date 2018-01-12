class RemoveStudentFromLogs < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :logs, :students
    remove_column :logs, :student_id
  end
end
