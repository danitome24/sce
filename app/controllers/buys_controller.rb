class BuysController < ApplicationController
  def express_checkout
    response = EXPRESS_GATEWAY.setup_purchase(2000,
                                              ip: request.remote_ip,
                                              return_url: 'http://e5a717c3.ngrok.io/es/checkout_details',
                                              cancel_return_url: 'http://e5a717c3.ngrok.io/es',
                                              currency: 'EUR',
                                              allow_guest_checkout: true,
                                              items: [{name: 'Order', description: '"Order  description', quantity: '1', amount: 2000}]
    )

    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)
  end

  def checkout_details
    @token = params[:token]
    @payer_id = params[:PayerID]
    @details = EXPRESS_GATEWAY.details_for(@token)
  end

  def purchase
    @tok = params[:token]
    @payer = params[:PayerID]
    @result = EXPRESS_GATEWAY.purchase(2000, {
        :token => @tok,
        :payer_id => @payer,
        :currency => 'EUR'
    })
  end
end
