# frozen_string_literal: true

class LineItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :quantity, :price, :description
end
