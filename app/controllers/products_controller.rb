class ProductsController < ApplicationController
     def view
     end
     def data
         @products = Product.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 product = Product.new
                 product.problem_id = $current_problem.id
                 product.productname = productname
                 product.save!
                 
                 @tid = product.id
             when "deleted"
                 product=Product.find(@id)
                 product.destroy

                 @tid = @id
             when "updated"
                 product=Product.find(@id)
                 product.problem_id = $current_problem.id
                 product.productname = productname
                 product.save!
                 
                 @tid = @id
         end 
     end
end