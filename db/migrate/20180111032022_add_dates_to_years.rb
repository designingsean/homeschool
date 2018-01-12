class AddDatesToYears < ActiveRecord::Migration[5.1]
  def change
    add_column :years, :start_date, :datetime
    add_column :years, :end_date, :datetime
  end
end
