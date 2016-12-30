class ApiClient < ApplicationRecord
  validates :name, presence: true
end
