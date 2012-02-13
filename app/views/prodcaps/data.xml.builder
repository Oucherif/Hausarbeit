#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Prodcap.find_all_by_problem_id($current_problem).each do |prodcap|
         xml.tag!("row",{ "id" => prodcap.id }) do
             xml.tag!("cell", Segment.find_by_id(prodcap.segment_id).segmentname)
           #zeige zu Segmentid zugehöriges Segment
             xml.tag!("cell", Timestep.find_by_id(prodcap.timestep_id).stepnumber)
           #zeige zu Zeitpunktid zugehörige Zahl
             xml.tag!("cell", prodcap.prodcapvalue)
         end
     end
 end