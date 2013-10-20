class Vote < ActiveRecord::Base
  belongs_to :petition
  attr_accessible :comment, :hall, :name

  validates_uniqueness_of :name
end
