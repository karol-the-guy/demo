# frozen_string_literal: true

class OfferSerializer
  include FastJsonapi::ObjectSerializer

  attributes :state
end
