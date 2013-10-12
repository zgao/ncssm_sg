class Petition < ActiveRecord::Base
  attr_accessible :body, :title

  has_many :signatures

  default_scope order: 'signatures_count desc'

  after_create :initialize_defaults

  private

  def initialize_defaults
    self.threshold ||= 10
    self.save!
  end
end
