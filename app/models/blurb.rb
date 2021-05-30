class Blurb < ApplicationRecord
  belongs_to :api_client
end

# == Schema Information
#
# Table name: blurbs
#
#  id            :integer          not null, primary key
#  message       :text
#  metadata      :jsonb            not null
#  source        :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  api_client_id :string
#
