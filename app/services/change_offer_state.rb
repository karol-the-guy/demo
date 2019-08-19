class ChangeOfferState
  def initialize(offer_id, desired_state)
    @offer_id = offer_id
    @desired_state = desired_state
  end

  def call
    find_offer
    offer_state_unlike? ? change_offer_state : return_error
  end

  private

  def find_offer
    @offer ||= Offer.find(@offer_id)
  end

  def offer_state_unlike?
    @offer.state != @desired_state
  end

  def return_error
    { error: "Offer already #{@desired_state}" }
  end

  def change_offer_state
    @offer.update(state: @desired_state)
  end
end
