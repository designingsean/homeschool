class RemoveRecordFromLogs < ActiveRecord::Migration
  def change
    remove_foreign_key :logs, :record
    remove_column :logs, :record_id
  end
end
