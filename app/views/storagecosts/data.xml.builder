#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Storagecost.find_all_by_problem_id($current_problem).each do |storagecost|
         xml.tag!("row",{ "id" => storagecost.id }) do
             xml.tag!("cell", Product.find_by_id(storagecost.product_id).productname)
             #zeige zu Produktid zugehörigen Produktnamen
             xml.tag!("cell", storagecost.storagecostvalue)
         end
     end
 end

