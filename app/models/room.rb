class Room < ApplicationRecord
  has_many :messages

  validates :name, presence: true, uniqueness: {case_sensative: false}
end
