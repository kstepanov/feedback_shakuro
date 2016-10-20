require 'rails_helper'

RSpec.describe RandomCode do
  describe '#code' do
    subject(:code) { described_class.numeric(length) }

    let(:length) { 5 }

    it 'returns random numeric code with given length' do
      expect(code).to match(/\A\d{#{length}}\z/)
    end

    it 'raise error if length is 0' do
      expect { described_class.numeric(0) }.to raise_error 'Length should be more then 0'
    end
  end
end
