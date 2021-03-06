#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Capusage.find_all_by_problem_id($current_problem).each do |capusage|
         xml.tag!("row",{ "id" => capusage.id }) do
           xml.tag!("cell", Product.find_by_id(capusage.product_id).productname)
           #zeige zu Produktid zugehörigen Produktnamen
           xml.tag!("cell", Segment.find_by_id(capusage.segment_id).segmentname)
           #zeige zu Segmentid zugehöriges Segment
           xml.tag!("cell", Preperiod.find_by_id(capusage.preperiod_id).preperiodnumber)
           #zeige zu Vorlaufperiodenid zugehörige Zahl
           xml.tag!("cell", capusage.capusagevalue)
         end
     end
 end