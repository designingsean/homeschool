class Record < ActiveRecord::Base
  belongs_to :student
  belongs_to :year
  belongs_to :grade
  has_many :logs
end
