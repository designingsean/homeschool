class Log < ActiveRecord::Base
  belongs_to :record
  belongs_to :subject
  belongs_to :teacher
  belongs_to :book

  before_save :normalize_blank_values

  def self.current_school_year
    self.joins(record: :year).where('CURDATE() BETWEEN start_date AND end_date').order(date: :desc)
  end

  def self.student_counts
    self.joins(record: :student).current_school_year.group(:record_id).select('records.id, students.first, COUNT(DISTINCT logs.date) AS count')
  end

  def normalize_blank_values
    attributes.each do |column, value|
      self[column].present? || self[column] = nil
    end
  end
end
