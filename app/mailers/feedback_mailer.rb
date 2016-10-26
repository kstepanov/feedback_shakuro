class FeedbackMailer < ApplicationMailer
  attr_reader :feedback

  def send_feedback(feedback)
    @feedback = feedback

    mail to: to, subject: subject, reply_to: feedback.customer_email
  end

  private

  def to
    [feedback.request.admin_user.email, 'achaly@shakuro.com']
  end

  def subject
    'New feedback request for the ' \
    "project '#{feedback.project_name}' feature '#{feedback.feature_name}'"
  end
end
