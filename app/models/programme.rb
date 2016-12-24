class Programme < ApplicationRecord
  belongs_to :user
  has_many :exercises
  accepts_nested_attributes_for :exercises
end
