namespace :export do
  desc "Prints Product.all in a seeds.rb way."
  task :seeds_format => :environment do
  Product.order(:id).all.each do |product|
      puts "Product.create(#{product.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at', 'id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
   end

  ProductCategory.order(:id).all.each do |productcate|
    puts "ProductCategory.create(#{productcate.serializable_hash.delete_if {|key, value| ['created_at', 'updated_at', 'id'].include?(key)}.to_s.gsub(/[{}]/,'')})"
  end
 end
end
