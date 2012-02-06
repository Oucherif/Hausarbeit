class SolutionsController < ApplicationController

  def view
    fi=File.open("HPPLAN_v1_OFV.txt", "r")
    line=fi.readline
    fi.close
    sa=line.split
    if sa[1]!=nil                                                 #Wenn Zielfktwert vorhanden
    @objective_function_value=sa[1]                               #speichere Wert zur Ausgabe
    end

    @solution=Solution.all
    @solution.each {|solution|
    solution.destroy}

    fi=File.open("HPPLAN_v1_Solution_Prod.txt", "r")
    fi.each {|line|
    prod=line.split(";")                                            #Trenne Zeile an ;
    prod0=prod[0].delete "k"+" "                                      #entferne Indikator und Leerzeichen
    prod1=prod[1].delete "t"+" "                                      #entferne Indikator und Leerzeichen
    prod2=prod[2].delete " "                                          #entferne Leerzeichen
    prod3=prod[3].delete " "

    @solution=Solution.new
    @solution.product_id=Product.all[prod0.to_i-1].id
    @solution.timestep_id=Timestep.all[prod1.to_i-1].id
    @solution.productionvalue=prod2
    @solution.storageamountvalue=prod3
    @solution.save!}

    fi.close
  end

end
