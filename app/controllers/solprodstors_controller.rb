class SolprodstorsController < ApplicationController

    def view
    fi=File.open("HPPLAN_v1_OFV.txt", "r")
    line=fi.readline
    fi.close
    sa=line.split
    if sa[1]!=nil                                                 #Wenn Zielfktwert vorhanden
    @objective_function_value=sa[1]                               #speichere Wert zur Ausgabe
    end

    @solprodstor=Solprodstor.find_all_by_problem_id($current_problem.id)
    @solprodstor.each {|solution|
    solution.destroy}

    fi=File.open("HPPLAN_v1_Solution_Prod.txt", "r")
    fi.each {|line|
    vector=line.split(";")                                              #Trenne Zeile an ;
    product=vector[0].delete "k"+" "                                    #entferne Indikator und Leerzeichen
    timestep=vector[1].delete "t"+" "                                   #entferne Indikator und Leerzeichen
    productionvalue=vector[2].delete " "                                #entferne Leerzeichen
    storageamountvalue=vector[3].delete " "

    @solprodstor=Solprodstor.new
    @solprodstor.problem_id=$current_problem.id
    @solprodstor.product_id=Product.find_all_by_problem_id($current_problem)[product.to_i-1].id
    @solprodstor.timestep_id=Timestep.find_all_by_problem_id($current_problem)[timestep.to_i-1].id
    @solprodstor.productionvalue=productionvalue
    @solprodstor.storageamountvalue=storageamountvalue
    @solprodstor.save!}

    fi.close
    end

end
