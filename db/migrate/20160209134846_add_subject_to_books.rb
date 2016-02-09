class AddSubjectToBooks < ActiveRecord::Migration
  def change
    add_reference(:books, :subject, foreign_key: true, null: true)
  end
end
