class Request < ApplicationRecord
  belongs_to :admin_user
  has_many :feedbacks, dependent: :nullify

  validates :project_name, :feature_name, :customer_name, :customer_email, presence: true
  validates :customer_email, format: { with: /.+@.+\..+/ }

  class << self
    def uid
      loop do
        code = RandomCode.numeric(8)
        break code unless exists?(uid: code)
      end
    end
  end

  def customer_name=(name)
    super(name.to_s.titleize)
  end
end
