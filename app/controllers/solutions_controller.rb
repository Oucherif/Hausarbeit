class SolutionsController < ApplicationController



  def index
      fi=File.open("HPPLAN_v1_OFV.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split
        if sa[1]!=nil                                                 #Wenn Zielfktwert vorhanden
        @objective_function_value=sa[1]                               #speichere Wert zur Ausgabe
        end
  end

end