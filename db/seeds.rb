require 'json'
require 'open-uri'

products_list = JSON.parse(File.read('products.json'))
i = 0
products_list.each do |product|

  # has_product = product.to_h
  Product.create!(
    title: (product['title']).delete("\u0000"),
    product_type: (product['type']).delete("\u0000"),
    description: (product['description']).delete("\u0000"),
    filename: (product['filename']).delete("\u0000"),
    height: product['height'],
    width: product['width'],
    price: product['price'],
    rating: product['rating']
  )
  puts "#{i} - #{ product['title'] } product was created!"
  i += 1
end

puts "#{Product.count} products created!"
# .delete("\u0000") due to rails aborted!
# ArgumentError: string contains null byte

3.times do
  ApiKey.create!
end
