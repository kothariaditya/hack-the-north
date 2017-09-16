class Record < ApplicationRecord
  belongs_to :user
  has_many :prescriptions
end
