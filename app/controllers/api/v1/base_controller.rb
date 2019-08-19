# frozen_string_literal: true

module Api
  module V1
    class BaseController < ActionController::API
      include ApiResponses
      rescue_from ActiveRecord::RecordNotFound, with: :not_found
      rescue_from ActionController::ParameterMissing, with: :forbidden

      private

      def validate_headers
        return true if request.headers['Content-Type'] == 'application/json'

        render json: {
          errors: [
            { title: 'Request is missing necessary headers. For more info visit: https://jsonapi.org/format/' }
          ]
        }, status: :not_acceptable
      end
    end
  end
end
