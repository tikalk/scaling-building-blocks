# == Schema Information
#
# Table name: likes
#
#  id          :integer          not null, primary key
#  likeability :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Like < ActiveRecord::Base
  belongs_to :product
  belongs_to :user
end
