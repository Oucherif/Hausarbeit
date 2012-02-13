#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Demand.find_all_by_problem_id($current_problem).each do |demand|
         xml.tag!("row",{ "id" => demand.id }) do
           xml.tag!("cell", Product.find_by_id(demand.product_id).productname)
           #zeige zu Produktid zugehörigen Produktnamen
           xml.tag!("cell", Timestep.find_by_id(demand.timestep_id).stepnumber)
           #zeige zu Zeitpunktid zugehörige Zahl
           xml.tag!("cell", demand.demandvalue)
         end
     end
 end