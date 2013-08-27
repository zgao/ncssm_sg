class Petition < ActiveRecord::Base
  attr_accessible :body, :threshold, :title
end
