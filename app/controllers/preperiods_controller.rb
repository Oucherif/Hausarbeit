# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class PreperiodsController < ApplicationController
     def view
       @title = "Vorlaufperioden"
     end
     def data
         @preperiods = Preperiod.all()
     end
     def dbaction
         #called for all db actions
         productname = params["c0"]
         preperiodnumber = params["c1"]

         @mode = params["!nativeeditor_status"]
         
         @id = params["gr_id"]
         case @mode
             when "inserted"
                 preperiod = Preperiod.new
                 preperiod.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   preperiod.product_id=nil
                 else  #finde zu Produktnamen zugehörige ID
                   preperiod.product_id = Product.find_by_productname(productname).id
                 end


                 preperiod.preperiodnumber = preperiodnumber
                 preperiod.save!
                 
                 @tid = preperiod.id
             when "deleted"
                 preperiod=Preperiod.find(@id)
                 preperiod.destroy

                 @tid = @id
             when "updated"
                 preperiod=Preperiod.find(@id)
                 preperiod.problem_id = $current_problem.id
                 if Product.find_by_productname(productname)==nil
                   preperiod.product_id=nil
                 else  #finde zu Produktnamen zugehörige ID
                   preperiod.product_id = Product.find_by_productname(productname).id
                 end
                 preperiod.preperiodnumber = preperiodnumber
                 preperiod.save!
                 
                 @tid = @id
         end 
     end
end