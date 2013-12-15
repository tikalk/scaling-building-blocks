# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  description :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  attr_accessible :user_id, :description
end
