class Clinic < ActiveRecord::Base
  belongs_to :hospital
  has_one :consultant
end