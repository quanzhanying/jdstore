namespace :dev do
  # namespace 方法可以把 Rake 任务分组，这样可以避免一些命名冲突，也显得更有条理。

  task :fetch_product => :environment do
  # :environment 表示执行 rake 任务时的 Rails 环境参数，默认为 development 环境，你可以通过 RAILS_ENV 参数来修改它: bundle exec rake first_student RAILS_ENV=production

    puts "Fetch product data..."
    # puts 就是打印显示的意思

    response = RestClient.get "https://yunbi.com//api/v2/markets"
    # rest_client 这个 gem 的用法，更多用法可以参照该 gem 的 Github 页面。注意这里抓取的数据是 JSON 格式，取决于 API 网站。

    data = JSON.parse(response.body)
    # 将抓过来的数据转成 ruby 格式，并存入 data 这个变量

    data.each do |m|
      existing_product = Product.find_by_product_id( m["id"] )
      # product_id 是 product 这个 model 的一个栏位，纪录聚合 API 的城市 id

      # 先确定该城市是否存在，如果不存在，则新建

      if existing_product.nil?
        Product.create!( :product_id => m["id"], :title => m["name"])
        # 将抓到的数据写入 product 这个 model

      end
    end

    puts "Total: #{Product.count} products"
  end
end
