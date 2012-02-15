# encoding: utf-8
class SolsegsController < ApplicationController

  def view

    @solseg=Solseg.find_all_by_problem_id($current_problem.id)
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

  def export
    if File.exist?("HPPLAN_v1_Solution_Segm_excel.txt")
       File.delete("HPPLAN_v1_Solution_Segm_excel.txt")
    end
    f=File.new("HPPLAN_v1_Solution_Segm_excel.txt", "w")

    printf(f, "Problemname, Segmentname, Zeitpunkt, genutzte Zusatzkapazitaet \n")
    i=0
    while Solseg.find_all_by_problem_id($current_problem.id)[i]!=nil
      @solseg=Solseg.find_all_by_problem_id($current_problem.id)[i]
      problemname=Problem.find_by_id(@solseg.problem_id).problemname
      segmentname=Segment.find_by_id(@solseg.segment_id).segmentname
      stepnumber=Timestep.find_by_id(@solseg.timestep_id).stepnumber
      addcapusagevalue=@solseg.addcapusagevalue
      printf(f, problemname+" , "+segmentname+" , "+stepnumber.to_s+" , "+addcapusagevalue.to_s+" \n")
      i=i+1
    end
    f.close
    send_file "HPPLAN_v1_Solution_Segm_excel.txt"
  end
end









#dependent destroy solsegs und solstor!