class Clinic < ActiveRecord::Base
  belongs_to :department
  has_one :consultant
end