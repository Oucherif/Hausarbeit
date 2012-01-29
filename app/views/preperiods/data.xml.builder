#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @preperiods.each do |preperiod|
         xml.tag!("row",{ "id" => preperiod.id }) do
             xml.tag!("cell", Product.find_by_id(preperiod.product_id).productname)   #zeige zu Produktid zugehörigen Produktnamen
             xml.tag!("cell", preperiod.preperiodnumber)
         end
     end
 end