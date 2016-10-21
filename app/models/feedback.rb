class Feedback < ApplicationRecord
  belongs_to :request

  validates :details, :rate, presence: true
  validates :rate, numericality: { greater_than: 0, less_than_or_equal_to: 5 }

  def request=(request)
    self.attributes = request.slice(
      :customer_name,
      :customer_email,
      :project_name,
      :feature_name
    )

    super
  end

  def customer_name=(name)
    super(name.to_s.titleize)
  end
end
