#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @addcapcosts.each do |addcapcost|
         xml.tag!("row",{ "id" => addcapcost.id }) do
             xml.tag!("cell", addcapcost.timestep_id)
             xml.tag!("cell", addcapcost.addcapcostvalue)
         end
     end
 end