#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     @storagestarts.each do |storagestart|
         xml.tag!("row",{ "id" => storagestart.id }) do
             xml.tag!("cell", Product.find_by_id(storagestart.product_id).productname)
             #zeige zu Produktid zugehörigen Produktnamen
             xml.tag!("cell", storagestart.storagestartvalue)
         end
     end
 end

