class PurchaseController < ApplicationController

  require "payjp"

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = "sk_test_1547c1078a795141e2ee8623"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = current_user.credit_card
    Payjp.api_key = "sk_test_1547c1078a795141e2ee8623"
    Payjp::Charge.create(
      amount: @item.price, 
      customer: card.customer_id, 
      currency: 'jpy',
    )
    redirect_to action: "done" 
  end
end
