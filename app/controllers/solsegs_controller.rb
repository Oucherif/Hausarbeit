class SolsegsController < ApplicationController

  def view

    @solseg=Solseg.all
    @solseg.each {|solseg|
    solseg.destroy}

    fi=File.open("HPPLAN_v1_Solution_Segm.txt", "r")
    fi.each {|line|
    vector=line.split(";")                                              #Trenne Zeile an ;
    segment=vector[0].delete "j"+" "                                    #entferne Indikator und Leerzeichen
    timestep=vector[1].delete "t"+" "                                   #entferne Indikator und Leerzeichen
    addcapusagevalue=vector[2].delete " "                                #entferne Leerzeichen

    @solseg=Solseg.new
    @solseg.problem_id=$current_problem.id
    @solseg.segment_id=Segment.find_all_by_problem_id($current_problem.id)[segment.to_i-1].id
    @solseg.timestep_id=Timestep.find_all_by_problem_id($current_problem.id)[timestep.to_i-1].id
    @solseg.addcapusagevalue=addcapusagevalue
    @solseg.save!}

    fi.close
  end


end
