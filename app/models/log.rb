class Log < ActiveRecord::Base
  belongs_to :record
  belongs_to :subject
  belongs_to :teacher
  belongs_to :book
end
