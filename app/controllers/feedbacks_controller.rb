class FeedbacksController < InheritedResources::Base
  attr_reader :feedback

  def create
    @feedback = Feedback.new(feedback_params)
    feedback.attributes = Request.find_by(uid: uid).feedback_attributes

    if feedback.save
      redirect_to thank_you_path
    else
      render :new, uid: uid
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rate, :details)
  end

  def uid
    @uid ||= params.require(:uid)
  end
end
