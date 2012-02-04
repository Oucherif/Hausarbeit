#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Segment.all.each do |segment|
         xml.tag!("row",{ "id" => segment.id }) do
             xml.tag!("cell", segment.segmentname)
         end
     end
 end