class Clinic < ActiveRecord::Base
  belongs_to :hospital
  has_many :doctors
end