class Department < ApplicationRecord
  has_many :devices, dependent: :destroy

  scope :find_department, -> name {where "name like ?", "%#{name}%"}
end
