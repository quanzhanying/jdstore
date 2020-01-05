module RandomCode
  class << self

    #這個model主要用於產生各種隨機變數，其他幾個後續備用

    #按規則，產生隨機密碼字符串

    def generate_password len = 8
      seed = (0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a + ['!', '@', '#', '$', '%', '.', '*']*4
      token = ""
      len.times { |t| token << seed.sample.to_s }
      token
    end

    def generate_cellphone_token len = 6
      a = lambda { (0..9).to_a.sample }
      token =""
      len.times { |t| token << a.call.to_s }
      token
    end

    def generate_utoken len = 8
      a = lambda { rand(36).to_s(36) }
      token = ""
      len.times { |t| token << a.call.to_s }
      token
    end

    #按規則，產生隨機產品序列號，前四位為月日

    def generate_product_uuid
      Date.today.to_s.split('-').join()[2..-1] << generate_utoken(5).upcase
    end
  end
end
