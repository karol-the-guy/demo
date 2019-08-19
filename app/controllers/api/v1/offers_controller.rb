# frozen_string_literal: true

module Api
  module V1
    class OffersController < BaseController
      def show
        ok(OfferSerializer.new(Offer.find_by(id: offer_params[:id])))
      end

      def accept_offer
        ChangeOfferState.new(offer_params[:id], 'accepted').call
        ok('Offer accepted')
      end

      def reject_offer
        ChangeOfferState.new(offer_params[:id], 'rejected').call
        ok('Offer rejected')
      end

      def offer_params
        params.permit(:state, :id)
      end
    end
  end
end
