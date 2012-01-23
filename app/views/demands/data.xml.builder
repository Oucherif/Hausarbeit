#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @demands.each do |demand|
         xml.tag!("row",{ "id" => demand.id }) do
           xml.tag!("cell", demand.product_id)
           xml.tag!("cell", demand.timestep_id)
           xml.tag!("cell", demand.demandvalue)
         end
     end
 end