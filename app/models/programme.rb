class Programme < ApplicationRecord
  belongs_to :user
  has_many :exercises, inverse_of: :programme
  accepts_nested_attributes_for :exercises
end
