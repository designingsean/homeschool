class Log < ActiveRecord::Base
  belongs_to :record
  belongs_to :subject
  belongs_to :teacher
  belongs_to :book

  before_save :normalize_blank_values

  def normalize_blank_values
    attributes.each do |column, value|
      self[column].present? || self[column] = nil
    end
  end
end
