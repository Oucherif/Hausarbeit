#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Timestep.all.each do |timestep|
         xml.tag!("row",{ "id" => timestep.id }) do
             xml.tag!("cell", timestep.stepnumber)
         end
     end
 end

