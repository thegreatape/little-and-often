class Activity < ApplicationRecord
  belongs_to :user
  has_many :activity_entries

  before_save :set_default_color, on: :create

  def set_default_color
    self.color ||= %w{#FE5F55 #F0B67F #D6D1B1 #C7EFCF #EEF5DB}.sample
  end
end
