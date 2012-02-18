# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class SolutionsController < ApplicationController



  def index
    @title = "Lösungsübersicht"
    if File.exist?("HPPLAN_v1_OFV.txt")
      fi=File.open("HPPLAN_v1_OFV.txt", "r")
      line=fi.readline
      fi.close
      sa=line.split
        if sa[1]!=nil                                                 #Wenn Zielfktwert vorhanden
        @objective_function_value=sa[1]                               #speichere Wert zur Ausgabe
        end
    else
    end
  end

end
