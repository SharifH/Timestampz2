class School < ActiveRecord::Base
  attr_accessible :name

  has_many :day_classes
  has_many :students
  has_many :teachers
end
