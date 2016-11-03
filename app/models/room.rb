class Room < ApplicationRecord
  validates :name, presence: true, uniqueness: {case_sensative: false}
end
