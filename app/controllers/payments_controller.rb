class PaymentsController < ApplicationController

  def new
    @art = Art.new
    @order = current_artist.orders.where(state: 'pending').find(params[:order_id])
    ids = @order.cart.map(&:to_i)
    @arts = Art.find(ids)
    @total = total_price
  end

  private

  def total_price
    sum = 0
    @arts.each do |art|
      sum += art.price
    end
    return sum
  end
end
