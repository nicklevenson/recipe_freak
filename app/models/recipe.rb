class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :cuisine
  has_many :ingredients 
  has_many :steps
end
