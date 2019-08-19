module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.api_token = loop do
      SecureRandom.urlsafe_base64(8).gsub("-","")
    end
  end
end
