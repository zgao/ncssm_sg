class Signature < ActiveRecord::Base
  attr_accessible :comment, :hall, :name, :petition

  belongs_to :petition, counter_cache: true
end
