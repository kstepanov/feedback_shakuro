class Feedback < ApplicationRecord
  belongs_to :request

  validates :details, :rate, presence: true
  validates :rate, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
