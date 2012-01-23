#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @prodcaps.each do |prodcap|
         xml.tag!("row",{ "id" => prodcap.id }) do
             xml.tag!("cell", prodcap.segment_id)
             xml.tag!("cell", prodcap.timestep_id)
             xml.tag!("cell", prodcap.prodcapvalue)
         end
     end
 end