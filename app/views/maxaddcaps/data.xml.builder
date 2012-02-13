#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
    Maxaddcap.find_all_by_problem_id($current_problem).each do |maxaddcap|
         xml.tag!("row",{ "id" => maxaddcap.id }) do
           xml.tag!("cell", Segment.find_by_id(maxaddcap.segment_id).segmentname)
           #zeige zu Segmentid zugehöriges Segment
           xml.tag!("cell", Timestep.find_by_id(maxaddcap.timestep_id).stepnumber)
           #zeige zu Zeitpunktid zugehörige Zahl
           xml.tag!("cell", maxaddcap.maxaddcapvalue)
         end
     end
 end