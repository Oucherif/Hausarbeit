#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @capusages.each do |capusage|
         xml.tag!("row",{ "id" => capusage.id }) do
           xml.tag!("cell", capusage.product_id)
           xml.tag!("cell", capusage.segment_id)
           xml.tag!("cell", capusage.preperiod_id)
           xml.tag!("cell", capusage.capusagevalue)
         end
     end
 end