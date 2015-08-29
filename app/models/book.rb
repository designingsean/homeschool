class Book < ActiveRecord::Base
  has_many :logs
end
