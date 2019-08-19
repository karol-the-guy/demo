require 'rails_helper'

RSpec.describe ChangeOfferState, type: :service do
  let!(:offer_with_line_item) { create(:offer_with_line_item) }

  describe '#call' do
    context 'when accept is provided as param' do
      subject { described_class.new(offer_with_line_item.id, 'accepted') }

      it 'accepts offer if param provided' do
        subject.call
        expect(offer_with_line_item.state).to eq 1
      end
    end

    context 'when reject is provided as param' do
      it 'rejects offer if param provided' do
        subject.call
        expect(offer_with_line_item.state).to eq 2
      end
    end
  end
end
