require 'rails_helper'

RSpec.describe RequestMailer, type: :mailer do
  describe 'send_request' do
    subject(:mail) { described_class.send_request(req) }
    let(:req) { build(:request) }

    it 'has wright `subject` header' do
      expect(mail.subject).to eq(
        "Feedback request for your project '#{req.project_name}' feature '#{req.feature_name}'"
      )
    end

    it 'has right `to` header' do
      expect(mail.to).to eq([req.customer_email])
    end

    it 'has right `from` header' do
      expect(mail.from).to eq([Rails.application.secrets.from_email])
    end

    it 'renders the project name' do
      expect(mail.body.encoded).to include(req.project_name)
    end

    it 'renders the feature name' do
      expect(mail.body.encoded).to include(req.feature_name)
    end

    it 'renders the link to new feedback' do
      expect(mail.body.encoded).to include(new_feedback_url(uid: req.uid))
    end
  end
end
