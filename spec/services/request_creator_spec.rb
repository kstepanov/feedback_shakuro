require 'rails_helper'

RSpec.describe RequestCreator do
  let(:valid_params) do
    {
      customer_name: 'John',
      customer_email: 'john@example.com',
      project_name: 'project name',
      feature_name: 'feature name'
    }
  end
  let(:invalid_params) { {} }
  let(:service) { described_class.new(params) }

  describe '#request' do
    subject(:request) { service.request }
    let(:params) { {} }

    it 'is instance of Request' do
      expect(request).to be_a Request
    end
  end

  describe '#create' do
    subject(:create) { service.create(admin_user) }
    let(:admin_user) { build :admin_user }

    context 'with valid params' do
      let(:params) { valid_params }

      it 'returns true' do
        expect(create).to eq true
      end

      it 'assigns uid' do
        create
        expect(service.request.uid).to be_present
      end

      it 'assigns current user' do
        create
        expect(service.request.admin_user).to eq admin_user
      end

      it 'sends email to customer' do
        message_delivery = instance_double(ActionMailer::MessageDelivery, deliver_later: nil)
        allow(RequestMailer).to receive(:send_request).with(kind_of(Request)).
          and_return(message_delivery)

        create

        expect(message_delivery).to have_received(:deliver_later)
      end
    end

    context 'with invalid params' do
      let(:params) { invalid_params }

      it 'returns false' do
        expect(create).to eq false
      end

      it 'does not sends emails' do
        expect(RequestMailer).not_to receive(:send_request)
        create
      end
    end
  end
end
