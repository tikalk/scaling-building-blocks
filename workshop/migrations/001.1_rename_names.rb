Product.all.each do |p|
  p.name += "-#{p.id}" 
  p.save!  
end 
