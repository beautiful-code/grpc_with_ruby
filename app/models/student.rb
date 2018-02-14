class Student < ApplicationRecord
  validates :name, presence: true
end
