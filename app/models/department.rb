class Department < ActiveRecord::Base
  belongs_to :hospital
  has_many :clinics
end