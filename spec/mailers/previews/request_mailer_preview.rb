# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/send_request
  def send_request
    RequestMailer.send_request(FactoryGirl.build(:request))
  end
end
