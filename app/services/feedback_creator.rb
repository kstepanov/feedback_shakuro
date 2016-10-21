class FeedbackCreator
  attr_reader :feedback

  def initialize(params)
    @feedback = Feedback.new(params)
  end

  def create(request)
    feedback.request = request
    success = feedback.save

    on_success if success

    success
  end

  private

  def on_success
    FeedbackMailer.send_feedback(feedback).deliver_later
  end
end
