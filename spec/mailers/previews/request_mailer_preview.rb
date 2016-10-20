# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview
  def initialize
    super
    @req = FactoryGirl.build(:request)
  end

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/send_request
  def send_request
    RequestMailer.send_request(req)
  end

  private

  attr_reader :req
end
