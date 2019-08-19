class OfferLineItem < ApplicationRecord
  belongs_to :offer
  belongs_to :line_item
end
