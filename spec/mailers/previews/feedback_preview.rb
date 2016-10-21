# Preview all emails at http://localhost:3000/rails/mailers/feedback
class FeedbackMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/feedback/send_feedback
  def send_feedback
    admin_user = FactoryGirl.build(:admin_user)
    req = FactoryGirl.build(:request, admin_user: admin_user)
    feedback = FactoryGirl.build(:feedback, request: req, rate: 12345)
    FeedbackMailer.send_feedback(feedback)
  end
end
