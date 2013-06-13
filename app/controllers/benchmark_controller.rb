# encoding: UTF-8

require 'benchmark'

class BenchmarkController < ApplicationController

  # Measure simulated random-page galery requests
  # IN: number of page requests
  # Note, on small data we won't feel any difference. However if we increase num_requests 
  #  to 1000 or more, we'll see a dramatic improvement.
  #
  # To be used from console only: 
  #  c = BenchmarkController.new
  #  c.fetch_products_randomly(100)
  #
  def fetch_products_randomly(num_requests = 10)
  	items_perpage = 30
  	pages_num = Product.count / items_perpage
  	
  	Benchmark.measure do 
      for i in 1..num_requests
        word = %w(מ מל מלפ מלפפ מלפפו מלפפון).sample
	  		random_page_num = Random.rand(1..pages_num)
		  	@products = Product.search { fulltext word; paginate :page => random_page_num, :per_page => 30 }.hits

		  	# That's basicallhy what's rendered in view, so let the ticks count
		  	@products.each do |product|
			  	nl = product.stored(:number_of_likers)
			    al = "%.1f" % product.stored(:average_likeability)
			    nr = product.stored(:number_of_reviews)
          #pp "nl, al, nr:  #{nl}, #{al}, #{nr} "
  			end
      end
  	end
  end
end
