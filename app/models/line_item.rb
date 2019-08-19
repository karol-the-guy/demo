class LineItem < ApplicationRecord
  has_many :offer_line_items
  has_many :offers, through: :offer_line_items

  validates :name, presence: true
  validates :unformatted_price, presence: true

  def price
    unformatted_price / 100.0
  end
end
