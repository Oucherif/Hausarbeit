#Übernommen aus http://www.dhtmlx.com/blog/?p=426%>
xml.instruct! :xml, :version=>"1.0"

 xml.tag!("rows") do
     Product.find_all_by_problem_id($current_problem).each do |product|
         xml.tag!("row",{ "id" => product.id }) do
             xml.tag!("cell", product.productname)
         end
     end
 end