class ApiClient < ApplicationRecord
  validates :name, presence: true
end

# == Schema Information
#
# Table name: api_clients
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
