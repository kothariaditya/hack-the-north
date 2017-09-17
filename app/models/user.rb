class User < ApplicationRecord
  include Hashid::Rails
  include DeviseTokenAuth::Concerns::User

  # Include default devise modules.
  devise :database_authenticatable, :registerable, :trackable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :email, presence: true
  serialize :major_diagnostics, Array
  serialize :allergies, Array
  has_many :Records
end
