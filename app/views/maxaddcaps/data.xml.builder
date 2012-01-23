#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @maxaddcaps.each do |maxaddcap|
         xml.tag!("row",{ "id" => maxaddcap.id }) do
           xml.tag!("cell", maxaddcap.segment_id)
           xml.tag!("cell", maxaddcap.timestep_id)
           xml.tag!("cell", maxaddcap.maxaddcapvalue)
         end
     end
 end