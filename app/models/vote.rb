class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :rating

  validates :user_id, presence: true
  validates :rating_id, presence: true
end
