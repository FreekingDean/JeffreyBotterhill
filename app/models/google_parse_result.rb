class GoogleParseResult < ApplicationRecord
end

# == Schema Information
#
# Table name: google_parse_results
#
#  id         :integer          not null, primary key
#  result     :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  blurb_id   :integer
#
