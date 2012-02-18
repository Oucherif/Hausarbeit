# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
class ConfigurationsController < ApplicationController

  def view
    @title = "Problemkonfiguration"
  end

  def optimize
    if File.exist?("HPPLAN_v1_Input_Instanz1.inc")
       File.delete("HPPLAN_v1_Input_Instanz1.inc")
    end
    f=File.new("HPPLAN_v1_Input_Instanz1.inc", "w")

    #Sets
    i=1
    printf(f, "set j / \n")
    @segments=Segment.find_all_by_problem_id($current_problem.id)
    @segments.each { |segments|
      printf(f, "j" + i.to_s + "\n")
      i=i+1}
    printf(f, "/ \n\n")

    i=1
    printf(f, "k / \n")
    @products=Product.find_all_by_problem_id($current_problem.id)
    @products.each { |products|
      printf(f, "k" + i.to_s + "\n")
      i=i+1}
    printf(f, "/ \n\n")

    printf(f, "t / \n")
    @timesteps=Timestep.find_all_by_problem_id($current_problem.id).sort!{|a,b| a.stepnumber <=> b.stepnumber}
    i=1
    @timesteps.each {|timesteps|
    printf(f, "t"+i.to_s+"\n")
    i=i+1}
    printf(f, "/ \n\n")

    i=1
    printf(f, "z / \n")
    @preperiods=Preperiod.find_all_by_problem_id($current_problem.id)
    @preperiods.each { |preperiods|
      printf(f, "z" + i.to_s + "\n")
    i=i+1}
    printf(f, "/")

    #Sets beendet
    printf(f, ";\n\n")

    #Parameter i(z)
    i=1
    printf(f, "Parameter i(z) \n /")
    @preperiods.each {|preperiods|
        printf(f, "z"+i.to_s)
        printf(f, " "+preperiods.preperiodnumber.to_s+"\n")
        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@preperiods.each.count+1
        #Sonst setze Komma
        else
          printf(f, ",")
        end
    }
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter h(k)
    @storagecosts=Storagecost.find_all_by_problem_id($current_problem.id)
    printf(f, "Parameter h(k) \n /")
    i=1
    @storagecosts.each { |storagecost|
      printf(f, "k" + i.to_s + " "+ storagecost.storagecostvalue.to_s + "\n")
      if storagecost!=@storagecosts.last
        printf(f, ",")
      end
      i=i+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter y0(k)
    @storagestarts=Storagestart.find_all_by_problem_id($current_problem.id)
    printf(f, "Parameter y0(k) \n /")
    i=1
    @storagestarts.each { |storagestart|
    printf(f, "k"+i.to_s + " "+storagestart.storagestartvalue.to_s + "\n")
    if storagestart!=@storagestarts.last
        printf(f, ",")
    end
    i=i+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter u(t)
    @addcapcosts=Addcapcost.find_all_by_problem_id($current_problem.id)
    printf(f, "Parameter u(t) \n /")
    i=1
    @addcapcosts.each { |addcapcosts|
      printf(f, "t" + i.to_s + " "+ addcapcosts.addcapcostvalue.to_s + "\n")
    if addcapcosts!=@addcapcosts.last
        printf(f, ",")
    end
    i=i+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter f(j,k,z)
    i=0
    printf(f, "Parameter f(j,k,z) \n /")
    j=1
    @segments.each {|segments|
      k=1
      @products.each{ |products|
        z=1
        @preperiods.each{ |preperiods|
        printf(f, "j"+j.to_s+"."+"k"+k.to_s+"."+"z"+z.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Capusage.find_by_problem_id_and_segment_id_and_product_id_and_preperiod_id($current_problem.id, segments.id, products.id, preperiods.id)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Capusage.find_by_problem_id_and_segment_id_and_product_id_and_preperiod_id($current_problem.id, segments.id, products.id, preperiods.id).capusagevalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@products.each.count*@preperiods.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
        z=z+1
        }
      k=k+1}
    j=j+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter b(j,t)
    i=0
    printf(f, "Parameter b(j,t) \n /")
    j=1
    @segments.each {|segments|
      t=1
      @timesteps.each{ |timesteps|
        printf(f, "j"+j.to_s+"."+"t"+t.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Prodcap.find_by_problem_id_and_segment_id_and_timestep_id($current_problem.id, segments.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Prodcap.find_by_problem_id_and_segment_id_and_timestep_id($current_problem.id, segments.id.to_s, timesteps.id.to_s).prodcapvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
        t=t+1
      }
    j=j+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")


    #Parameter d(k,t)
    i=0
    printf(f, "Parameter d(k,t) \n /")
    k=1
    @products.each {|products|
      t=1
      @timesteps.each{ |timesteps|
        printf(f, "k"+k.to_s+"."+"t"+t.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Demand.find_by_problem_id_and_product_id_and_timestep_id($current_problem.id, products.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Demand.find_by_problem_id_and_product_id_and_timestep_id($current_problem.id, products.id.to_s, timesteps.id.to_s).demandvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@products.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
      t=t+1}
    k=k+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")

    #Parameter Umax(j,t)
    i=0
    printf(f, "Parameter Umax(j,t) \n /")
    j=1
    @segments.each {|segments|
      t=1
      @timesteps.each{ |timesteps|
        printf(f, "j"+j.to_s+"."+"t"+t.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Maxaddcap.find_by_problem_id_and_segment_id_and_timestep_id($current_problem.id,segments.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Maxaddcap.find_by_problem_id_and_segment_id_and_timestep_id($current_problem.id, segments.id.to_s, timesteps.id.to_s).maxaddcapvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
      t=t+1}
    j=j+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")

    f.close


    # Die Zusatzbedingungen gewährleisten, dass kein Produkt in der Vergangenheit Belastungen auslöst
    if File.exist?("HPPLAN_v1_Input_Zusatzbedingung.inc")
       File.delete("HPPLAN_v1_Input_Zusatzbedingung.inc")
    end
    f=File.new("HPPLAN_v1_Input_Zusatzbedingung.inc", "w")

    @capusage=Capusage.find_all_by_problem_id($current_problem.id)
    @products=Product.find_all_by_problem_id($current_problem.id)
    k=1                                                                                                       #k Laufindex für Produkte
    @products.each {|product|                                                                                 #Für jedes Produkt
      @capusage.each {|capusage|                                                                              #und jeden Kapazitätsbelastungswert
      if product.id==capusage.product_id                                                                      #prüfe, ob Kapazitätsbelastungswert zum Produkt gehört
        if capusage.capusagevalue!=0 and Preperiod.find_by_id(capusage.preperiod_id).preperiodnumber!=0       #wenn Kapazitätsbelastungswert und Vorlaufperiode nicht 0
          t=1                                                                                                 #setze t=1
          while t<Preperiod.find_by_id(capusage.preperiod_id).preperiodnumber+1                               #solange t kleiner/gleich Vorlaufperiode
            printf(f, "x.fx('k"+k.to_s+"', 't"+t.to_s+"') = 0 ;\n")                                           #erstelle entsprechende Zusatzbedingung
            t=t+1                                                                                             #zähle t hoch
          end
        end
      end
      }
      k=k+1                                                                                                   #zähle k hoch
    }

    f.close

    if File.exist?("HPPLAN_v1_Solution_Prod.txt")
      File.delete("HPPLAN_v1_Solution_Prod.txt")
    end

    if File.exist?("HPPLAN_v1_Solution_Segm.txt")
      File.delete("HPPLAN_v1_Solution_Segm.txt")
    end

    if File.exist?("HPPLAN_v1_OFV.txt")
      File.delete("HPPLAN_v1_OFV.txt")
    end

    system "c:\\programme\\GAMS23.7\\gams HPPLAN_v1" #Zielpfad muss Rechnergebunden angepasst werden

    redirect_to solutions_path
  end
end
