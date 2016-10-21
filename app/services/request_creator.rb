class RequestCreator
  attr_reader :request, :admin_user

  def initialize(params, admin_user)
    @request = Request.new(params)
    @admin_user = admin_user
  end

  def create
    request.uid = Request.uid
    request.admin_user = admin_user
    success = request.save

    on_success if success

    success
  end

  private

  def on_success
    RequestMailer.send_request(request).deliver_later
  end
end
