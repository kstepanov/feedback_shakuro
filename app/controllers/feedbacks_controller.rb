class FeedbacksController < InheritedResources::Base
  attr_reader :feedback

  def new
    @feedback = Feedback.new(request: uid_request)
  end

  def create
    feedback_creator = FeedbackCreator.new(feedback_params)

    if feedback_creator.create(uid_request)
      redirect_to thank_you_path
    else
      @feedback = feedback_creator.feedback
      render :new, uid: uid
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:rate, :details)
  end

  def uid
    params[:uid].presence || not_found
  end

  def uid_request
    Request.find_by!(uid: uid)
  end
end
