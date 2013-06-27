# encoding: utf-8

class UpdateDatabaseWorker
  include Sidekiq::Worker

  def perform
  	puts "started"

  	names = %w( עגבנייה תפוז בשר חלב מלפפון )

  	ps = Product.limit(1000).reverse_order
  	ps.each do |product|
  		puts product.name
  		product.name = names.sample + product.id.to_s
  		product.save!
  	end

  	puts "finished"
  end
end