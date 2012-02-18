# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class StoragecostsController < ApplicationController
     def view
        @title = "Lagerhaltungskosten"
     end
     def data
         @storagecosts = Storagecost.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         storagecostvalue = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 storagecost = Storagecost.new
                 storagecost.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   storagecost.product_id=nil
                 else  #finde zu Produktnamen zugehörige ID
                   storagecost.product_id = Product.find_by_productname(productname).id
                 end
                 storagecost.storagecostvalue = storagecostvalue
                 storagecost.save!
                 
                 @tid = storagecost.id
             when "deleted"
                 storagecost=Storagecost.find(@id)
                 storagecost.destroy
                 
                 @tid = @id
             when "updated"
                 storagecost=Storagecost.find(@id)
                 storagecost.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   storagecost.product_id=nil
                 else  #finde zu Produktnamen zugehörige ID
                   storagecost.product_id = Product.find_by_productname(productname).id
                 end
                 storagecost.storagecostvalue = storagecostvalue
                 storagecost.save!
                 
                 @tid = @id
         end 
     end
end