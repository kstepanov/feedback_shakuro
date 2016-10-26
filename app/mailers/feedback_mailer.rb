class FeedbackMailer < ApplicationMailer
  SUPER_ADMIN_EMAIL = 'achaly@shakuro.com'.freeze

  attr_reader :feedback

  def send_feedback(feedback)
    @feedback = feedback

    mail to: to, subject: subject, reply_to: feedback.customer_email
  end

  private

  def to
    [feedback.request.admin_user.email, SUPER_ADMIN_EMAIL]
  end

  def subject
    'New feedback request for the ' \
    "project '#{feedback.project_name}' feature '#{feedback.feature_name}'"
  end
end
