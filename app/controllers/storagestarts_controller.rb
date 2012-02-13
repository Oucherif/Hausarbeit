class StoragestartsController < ApplicationController
     def view
     end
     def data
         @storagestarts = Storagestart.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         storagestartvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 storagestart = Storagestart.new
                 storagestart.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   storagestart.product_id=nil
                 else #finde zu Produktnamen zugehörige ID
                  storagestart.product_id = Product.find_by_productname(productname).id
                 end

                 storagestart.storagestartvalue = storagestartvalue
                 storagestart.save!
                 
                 @tid = storagestart.id
             when "deleted"
                 storagestart=Storagestart.find(@id)
                 storagestart.destroy
                 
                 @tid = @id
             when "updated"
                 storagestart=Storagestart.find(@id)
                 storagestart.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   storagestart.product_id=nil
                 else #finde zu Produktnamen zugehörige ID
                  storagestart.product_id = Product.find_by_productname(productname).id
                 end

                 storagestart.storagestartvalue = storagestartvalue
                 storagestart.save!
                 
                 @tid = @id
         end 
     end
end