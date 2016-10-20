class Feedback < ApplicationRecord
  belongs_to :request

  validates :details, :rate, presence: true
  validates :rate, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  def request=(request)
    self.attributes = request.feedback_attributes
    super
  end
end
