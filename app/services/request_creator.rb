class RequestCreator
  attr_reader :request

  def initialize(params)
    @request = Request.new(params)
  end

  def create(admin_user)
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
