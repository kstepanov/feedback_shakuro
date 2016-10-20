class RequestMailer < ApplicationMailer
  helper_method :feedback_url

  attr_reader :req

  def send_request(req)
    @req = req

    mail to: to, subject: subject
  end

  private

  def to
    address = Mail::Address.new(req.customer_email)
    address.display_name = req.customer_name
    address
  end

  def subject
    ['Feedback request for your', project, feature].join(' ')
  end

  def project
    "project '#{req.project_name}'"
  end

  def feature
    "feature '#{req.feature_name}'"
  end

  def feedback_url
    @feedback_url ||= new_feedback_url(uid: req.uid)
  end
end
