# frozen_string_literal: true

module ApiResponses
  def created(data)
    render json: data, status: :created
  end

  def ok(data)
    render json: data, status: :ok
  end

  def validations_failed(action)
    render json: { errors: form.validation_errors(action) }, status: :unprocessable_entity
  end

  def not_found(exception)
    render json: { errors: [{ title: exception.message }] }, status: :not_found
  end

  def conflict
    render json: {}, status: :conflict
  end

  def no_content
    render json: {}, status: :no_content
  end

  def bad_request
    render json: { errors: [{ title: 'Invalid request' }] }, status: :bad_request
  end
end
