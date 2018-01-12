class AddRecordsToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :record_id, :integer, index: true, foreign_key: true, null: false, default: 1
    change_column :logs, :record_id, :integer, default: nil
  end
end
