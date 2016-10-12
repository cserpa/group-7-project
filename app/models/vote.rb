class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :rating

  validates :user_id, presence: true
  validates :rating_id, presence: true
  validates :value, presence: true, numericality: { only_integer: true, inclusion: -1..1 }

end
