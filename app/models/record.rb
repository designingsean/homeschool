class Record < ActiveRecord::Base
  belongs_to :student
  belongs_to :year
  belongs_to :grade
  has_many :logs

  def self.current_students
    self.joins(:year, :student).where('CURDATE() BETWEEN start_date AND end_date').select(:id, 'students.first as first')
  end
end
