# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  viewer_id  :integer          not null
#  artwork_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ApplicationRecord
  belongs_to :viewer,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork

  validates :artwork_id, uniqueness: { scope: :viewer_id }
end
