class Device < ApplicationRecord
  belongs_to :department

  enum unit: {cai: 0, bo: 1}
end
