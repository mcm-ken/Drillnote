class Project < ActiveRecord::Base

  serialize :member

  belongs_to :user
  has_many :sheets
  has_many :members
end
