class Department < ApplicationRecord
  has_many :devices, dependent: :destroy

  pg_search_scope :find_department, against: :name
end
