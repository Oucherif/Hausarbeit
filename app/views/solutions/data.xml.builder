#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Solution.all.each do |solution|
         xml.tag!("row",{ "id" => solution.id }) do
           if Product.find_by_id(solution.product_id)==nil
           else
             xml.tag!("cell", Product.find_by_id(solution.product_id).productname)
           end

           if Timestep.find_by_id(solution.timestep_id)==nil
           else
             xml.tag!("cell", Timestep.find_by_id(solution.timestep_id).stepnumber)
           end

             xml.tag!("cell", solution.productionvalue)
             xml.tag!("cell", solution.storageamountvalue)
         end
     end
 end