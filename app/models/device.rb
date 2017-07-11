class Device < ApplicationRecord
  belongs_to :department

  enum unit: {cai: 0, bo: 1}

  delegate :name, to: :department, prefix: true

  pg_search_scope :find_device, against: :name
end
