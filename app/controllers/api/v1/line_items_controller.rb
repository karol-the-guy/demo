# frozen_string_literal: true

module Api
  module V1
    class LineItemsController < BaseController
      def show
        ok(LineItemSerializer.new(LineItem.find_by(id: params[:id])))
      end
    end
  end
end
