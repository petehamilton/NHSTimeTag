class Hospital < ActiveRecord::Base
  has_many :clinics
end