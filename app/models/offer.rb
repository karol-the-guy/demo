class Offer < ApplicationRecord
  has_many :offer_line_items
  has_many :line_items, through: :offer_line_items

  enum state: { pending: 0, accepted: 1, rejected: 2 }

  validates :line_items, presence: true
end
