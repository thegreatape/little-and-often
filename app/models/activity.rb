class Activity < ApplicationRecord
  belongs_to :user
  has_many :activity_entries
end
