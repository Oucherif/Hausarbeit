class StoragestartsController < ApplicationController
     def view
     end
     def data
         @storagestarts = Storagestart.all()
     end
     def dbaction
         #called for all db actions
         product_id = params["c0"]
         storagestartvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 storagestart = Storagestart.new
                 storagestart.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 storagestart.storagestartvalue = storagestartvalue
                 storagestart.save!
                 
                 @tid = storagestart.id
             when "deleted"
                 storagestart=Storagestart.find(@id)
                 storagestart.destroy
                 
                 @tid = @id
             when "updated"
                 storagestart=Storagestart.find(@id)
                 storagestart.product_id = Product.find_by_productname(product_id).id
                 #finde zu Produktnamen zugehörige ID
                 storagestart.storagestartvalue = storagestartvalue
                 storagestart.save!
                 
                 @tid = @id
         end 
     end
end