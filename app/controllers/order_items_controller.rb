class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    if @order.save
      session[:order_id] = @order.id
      respond_to do |format|
        format.js { flash[:success] = t('order_created') }
      end
    else
      respond_to do |format|
        format.js { flash[:danger] = t('error') }
      end
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find_by(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find_by(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

  private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
