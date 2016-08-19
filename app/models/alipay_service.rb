class AlipayService
  GATEWAY_URL = 'https://mapi.alipay.com/gateway.do'.freeze

  def initialize(order)
    @order = order
  end

  def credential
    eval(@order.pingpp_info)[:alipay_pc_direct]
  end

  def url
    uri = URI(GATEWAY_URL)
    uri.query = URI.encode_www_form(credential)
    uri
  end
end
