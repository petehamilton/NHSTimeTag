class Hospital < ActiveRecord::Base
  has_many :departments
end