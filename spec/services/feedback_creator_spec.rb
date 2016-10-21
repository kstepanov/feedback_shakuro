require 'rails_helper'

RSpec.describe FeedbackCreator do
  let(:valid_params) { { details: 'details', rate: 2 } }
  let(:invalid_params) { {} }
  let(:service) { described_class.new(params) }

  describe '#feedback' do
    subject(:feedback) { service.feedback }
    let(:params) { {} }

    it 'is instance of Fequest' do
      expect(feedback).to be_a Feedback
    end
  end

  describe '#create' do
    subject(:create) { service.create(request) }
    let(:request) { build(:request) }

    context 'with valid params' do
      let(:params) { valid_params }

      it 'returns true' do
        expect(create).to eq true
      end

      it 'assigns request' do
        create
        expect(service.feedback.request).to eq request
      end

      it 'sends email to customer' do
        message_delivery = instance_double(ActionMailer::MessageDelivery, deliver_later: nil)
        allow(FeedbackMailer).to receive(:send_feedback).with(kind_of(Feedback)).
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
        expect(FeedbackMailer).not_to receive(:send_feedback)
        create
      end
    end
  end
end
