#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
    Solprodstor.find_all_by_problem_id($current_problem).each do |solprodstor|
         xml.tag!("row",{ "id" => solprodstor.id }) do
           if Product.find_by_id(solprodstor.product_id)==nil
           else
             xml.tag!("cell", Product.find_by_id(solprodstor.product_id).productname)
           end

           if Timestep.find_by_id(solprodstor.timestep_id)==nil
           else
             xml.tag!("cell", Timestep.find_by_id(solprodstor.timestep_id).stepnumber)
           end

             xml.tag!("cell", solprodstor.productionvalue)
             xml.tag!("cell", solprodstor.storageamountvalue)
         end
     end
 end