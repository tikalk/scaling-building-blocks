plast = Product.last
for i in 0..4000
    dupobj = plast.dup
    dupobj.image = plast.image
    dupobj.save!
end
