class Request < ApplicationRecord



  belongs_to :admin_user
  has_many :feedbacks, dependent: :nullify

  validates :customer_name, :customer_email, :project_name, :feature_name, presence: true
  validates :customer_email, format: { with: /.+@.+\..+/ }

  class << self
    def uid
      code = RandomCode.numeric(8) while exists?(uid: code)
      code
    end
  end

  def feedback_attributes
    slice(:customer_name, :customer_email, :project_name, :feature_name)
  end


  "sadfsdf"


  def test a,b,c,d,e
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
    a.a + a.a + a.a
  end
end
