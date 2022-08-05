class OrdersController < ApplicationController

  def create
    carts = Art.find(session[:cart])
    order = Order.create!(cart: session[:cart], state: "pending", artist: current_artist)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "My Designs",
        images: [carts[0].image_url],
        amount: total_price,
        currency: 'GBP',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    empty_session
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_artist.orders.find(params[:id])
    @arts = Art.find(@order.cart)
  end

  private

  def total_price
    carts = Art.find(session[:cart])
    sum = 0
    carts.each do |cart|
      sum += cart.price_cents
    end
    return sum
  end

  def empty_session
    session[:cart] = []
  end
end
