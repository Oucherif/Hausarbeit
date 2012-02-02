class ProblemsController < ApplicationController
  def new

  end

  def index

  end

  def optimize
    if File.exist?("HPPLAN_v1_Input_Instanz1.inc")
       File.delete("HPPLAN_v1_Input_Instanz1.inc")
    end
    f=File.new("HPPLAN_v1_Input_Instanz1.inc", "w")

    #Sets
    printf(f, "set j / \n")
    @segments=Segment.all
    @segments.each { |segments|
      printf(f, "j" + segments.id.to_s + "\n")}
    printf(f, "/ \n\n")

    printf(f, "k / \n")
    @products=Product.all
    @products.each { |products|
      printf(f, "k" + products.id.to_s + "\n")}
    printf(f, "/ \n\n")

    printf(f, "t / \n")
    @timesteps=Timestep.all
    t=1
    while t<@timesteps.count+1
    printf(f, "t"+Timestep.find_by_stepnumber([t]).id.to_s+"\n")
    t=t+1
    end
    printf(f, "/ \n\n")

    printf(f, "z / \n")
    @preperiods=Preperiod.all
    @preperiods.each { |preperiods|
      printf(f, "z" + preperiods.id.to_s + "\n")}
    printf(f, "/ \n\n")

    #Parameter i(z)
    i=0
    printf(f, "Parameter i(z) \n /")
    @preperiods.each {|preperiods|
        printf(f, "z"+preperiods.id.to_s)
        printf(f, " "+preperiods.preperiodnumber.to_s+"\n")

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@preperiods.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
    }
    printf(f, "/ \n\n")

    #Parameter h(k)
    @storagecosts=Storagecost.all
    printf(f, "Parameter h(k) \n /")

    @storagecosts.each { |storagecost|
      printf(f, "k" + storagecost.product_id.to_s + " "+ storagecost.storagecostvalue.to_s + "\n")
      if storagecost!=@storagecosts.last
        printf(f, ",")
      end
      }
    printf(f, "/ \n\n")

    #Parameter y0(k)
    @storagestarts=Storagestart.all
    printf(f, "Parameter y0(k) \n /")
    @storagestarts.each { |storagestart|
    printf(f, "k"+storagestart.product_id.to_s + " "+storagestart.storagestartvalue.to_s + "\n")
    if storagestart!=@storagestarts.last
        printf(f, ",")
    end
    }
    printf(f, "/ \n\n")

    #Parameter u(t)
    @addcapcosts=Addcapcost.all
    printf(f, "Parameter u(t) \n /")
    @addcapcosts.each { |addcapcosts|
      printf(f, "t" + addcapcosts.timestep_id.to_s + " "+ addcapcosts.addcapcostvalue.to_s + "\n")
    if addcapcosts!=@addcapcosts.last
        printf(f, ",")
    end
    }
    printf(f, "/ \n\n")









    #Parameter f(j,k,z)
    i=0
    printf(f, "Parameter f(j,k,z) \n /")
    @segments.each {|segments|
      @products.each{ |products|
        @preperiods.each{ |preperiods|
        printf(f, "j"+segments.id.to_s+"."+"k"+products.id.to_s+"."+"z"+preperiods.id.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Capusage.find_by_segment_id_and_product_id_and_preperiod_id(segments.id, products.id, preperiods.id)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Capusage.find_by_segment_id_and_product_id_and_preperiod_id(segments.id, products.id, preperiods.id).capusagevalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@products.each.count*@preperiods.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end

        }
      }
    }
    printf(f, "/ \n\n")

    #Parameter b(j,t)
    i=0
    printf(f, "Parameter b(j,t) \n /")
    @segments.each {|segments|
      @timesteps.each{ |timesteps|
        printf(f, "j"+segments.id.to_s+"."+"t"+timesteps.id.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Prodcap.find_by_segment_id_and_timestep_id(segments.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Prodcap.find_by_segment_id_and_timestep_id(segments.id.to_s, timesteps.id.to_s).prodcapvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
      }
    }
    printf(f, "/ \n\n")

    #Parameter d(k,t)
    i=0
    printf(f, "Parameter d(k,t) \n /")
    @products.each {|products|
      @timesteps.each{ |timesteps|
        printf(f, "k"+products.id.to_s+"."+"t"+timesteps.id.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Demand.find_by_product_id_and_timestep_id(products.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Demand.find_by_product_id_and_timestep_id(products.id.to_s, timesteps.id.to_s).demandvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@products.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
      }
    }
    printf(f, "/ \n\n")

    #Parameter Umax(j,t)
    i=0
    printf(f, "Parameter Umax(j,t) \n /")
    @segments.each {|segments|
      @timesteps.each{ |timesteps|
        printf(f, "j"+segments.id.to_s+"."+"t"+timesteps.id.to_s)

        #Wenn kein Eintrag, dann setze 0 ein
        if Maxaddcap.find_by_segment_id_and_timestep_id(segments.id.to_s, timesteps.id.to_s)==nil
          printf(f, " 0 \n")
        #Sonst gib zugehörigen Wert aus
        else
          printf(f, " "+Maxaddcap.find_by_segment_id_and_timestep_id(segments.id.to_s, timesteps.id.to_s).maxaddcapvalue.to_s)
          printf(f, "\n")
        end

        i=i+1
        #Wenn letzter Eintrag, dann setze kein Komma
        if i==@segments.each.count*@timesteps.each.count
        #Sonst setze Komma
        else
          printf(f, ",")
        end
      }
    }
    printf(f, "/ \n\n")

    f.close

    if File.exist?("HPPLAN_v1_Solution")
      File.delete("HPPLAN_v1_Solution")
    end

    system "c:\\programme\\GAMS23.7\\gams HPPLAN_v1" #Zielpfad muss Rechnergebunden angepasst werden

    render :template => "problems/index"
  end

end
