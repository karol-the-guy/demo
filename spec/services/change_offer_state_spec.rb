require 'rails_helper'

RSpec.describe ChangeOfferState, type: :service do
  let(:line_item) { create(:line_item) }
  let(:offer) { create(:offer, line_items: [line_item]) }

  describe '#call' do
    context 'when accept is provided as param' do
      subject { described_class.new(offer.id, 'accepted') }

      it 'accepts offer if param provided' do
        subject.call
        expect(offer.reload.state).to eq('accepted')
      end
    end

    context 'when reject is provided as param' do
      subject { described_class.new(offer.id, 'rejected') }

      it 'rejects offer if param provided' do
        subject.call
        expect(offer.reload.state).to eq('rejected')
      end

      it 'returns error if performed more than once' do
        subject.call
        expect(subject.call).to eq({:error=>"Offer already rejected"})
      end
    end
  end
end
