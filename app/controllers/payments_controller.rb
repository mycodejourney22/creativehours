class PaymentsController < ApplicationController

  def new
    @order = current_artist.orders.where(state: 'pending').find(params[:order_id])
    ids = @order.cart.map(&:to_i)
    @arts = Art.find(ids)
  end
end
