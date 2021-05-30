require 'test_helper'

class BlurbTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
