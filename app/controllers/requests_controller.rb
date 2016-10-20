class RequestsController < InheritedResources::Base
  attr_reader :req

  before_action :authenticate_admin_user!, only: [:new, :create]

  def new
    @req = Request.new
  end

  def create
    @req = Request.new(request_params)
    req.uid = Request.uid

    if req.save
      RequestMailer.send_request(req).deliver_later
      redirect_to new_request_path, flash: { notice: 'Request sucessfully sent' }
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:project_name, :feature_name, :customer_name, :customer_email)
  end
end
