class BuysController < ApplicationController
  def express_checkout
    if !user_signed_in?
      flash[:danger] = t('log_in_suggestion')
      redirect_to root_path
    end
    @order = Order.find_by(client_id: current_user.id)
    response = EXPRESS_GATEWAY.setup_purchase(@order.subtotal*100,
                                              ip: request.remote_ip,
                                              return_url: 'http://dec457b3.ngrok.io/es/checkout_details',
                                              cancel_return_url: 'http://dec457b3.ngrok.io/es',
                                              currency: 'EUR',
                                              allow_guest_checkout: true,
                                              items: [{name: 'Order', description: '"Order  description', quantity: '1', amount: @order.subtotal*100}]
    )

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def checkout_details
    @token = params[:token]
    @payer_id = params[:PayerID]
    @details = EXPRESS_GATEWAY.details_for(@token)
  end

  def purchase
    order = Order.find_by(client_id: current_user.id)
    @tok = params[:token]
    @payer = params[:PayerID]
    @result = EXPRESS_GATEWAY.purchase(order.subtotal*100, {
        :token => @tok,
        :payer_id => @payer,
        :currency => 'EUR'
    })
    if @result.success?
      # Borramos provisionalmente
      order.destroy
      #Order.find_by(client_id: current_user.id).update(order_status_id: 3)
    end
  end
end
