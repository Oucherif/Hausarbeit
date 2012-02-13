#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Segment.find_all_by_problem_id($current_problem).each do |segment|
         xml.tag!("row",{ "id" => segment.id }) do
             xml.tag!("cell", segment.segmentname)
         end
     end
 end