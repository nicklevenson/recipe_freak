class Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :cuisine
  has_many :ingredients, :dependent => :destroy
  has_many :steps, :dependent => :destroy
end
