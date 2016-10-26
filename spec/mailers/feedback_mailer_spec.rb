require 'rails_helper'

RSpec.describe FeedbackMailer, type: :mailer do
  describe 'send_request' do
    subject(:mail) { described_class.send_feedback(feedback) }

    let(:admin_user) { build(:admin_user) }
    let(:req) { build(:request, admin_user: admin_user) }
    let(:feedback) { build(:feedback, request: req) }

    it 'has wright `subject` header' do
      expect(mail.subject).to eq(
        'New feedback request for the ' \
        "project '#{feedback.project_name}' feature '#{feedback.feature_name}'"
      )
    end

    it 'has right `to` header' do
      expect(mail.to).to eq([admin_user.email,'achaly@shakuro.com'])
    end

    it 'has right `from` header' do
      expect(mail.from).to eq([Rails.application.secrets.from_email])
    end

    it 'has right `reply_to` header' do
      expect(mail.reply_to).to eq([feedback.customer_email])
    end

    it 'renders the rate' do
      expect(mail.body.encoded).to include(feedback.rate.to_s)
    end

    it 'renders the details' do
      expect(mail.body.encoded).to include(feedback.details)
    end

    it 'renders the customer_name' do
      expect(mail.body.encoded).to include(feedback.customer_name)
    end
  end
end
