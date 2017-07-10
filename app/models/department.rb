class Department < ApplicationRecord
  has_many :devices, dependent: :destroy
end
