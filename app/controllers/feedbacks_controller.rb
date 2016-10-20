class FeedbacksController < InheritedResources::Base
  attr_reader :feedback

  def new
    @feedback = Feedback.new(request: uid_request)
  end

  def create
    @feedback = Feedback.new(feedback_params)
    feedback.request = uid_request

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

  def uid_request
    @uid_request ||= Request.find_by!(uid: uid)
  end

  def uid
    params[:uid].presence || not_found
  end
end
