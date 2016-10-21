class RequestsController < InheritedResources::Base
  attr_reader :req

  before_action :authenticate_admin_user!, only: [:new, :create]

  def new
    @req = Request.new
  end

  def create
    creator = RequestCreator.new(request_params, current_admin_user)

    if creator.create
      redirect_to new_request_path, flash: { notice: 'Request sucessfully sent' }
    else
      @req = creator.request
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:project_name, :feature_name, :customer_name, :customer_email)
  end
end
