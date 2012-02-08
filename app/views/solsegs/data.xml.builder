#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Solseg.all.each do |solseg|
         xml.tag!("row",{ "id" => solseg.id }) do
           if Segment.find_by_id(solseg.segment_id)==nil
           else
             xml.tag!("cell", Segment.find_by_id(solseg.segment_id).segmentname)
           end

           if Timestep.find_by_id(solseg.timestep_id)==nil
           else
             xml.tag!("cell", Timestep.find_by_id(solseg.timestep_id).stepnumber)
           end

             xml.tag!("cell", solseg.addcapusagevalue)
         end
     end
 end