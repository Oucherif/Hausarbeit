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
    printf(f, "Parameter i(z) \n /")
    l=0
    d=0                                                                                             #Weiterzähldummy
    while l<@products.count
    i=0
      while i<Preperiod.find_all_by_product_id(@products[l].id).count                               #Solange nicht alle Vorlaufperioden des Produkts abgelaufen
        printf(f, "z"+@preperiods[i+d].id.to_s+" "+i.to_s)                                          #Gib id des Eintrags von i+d und deren Wert an
         if i==Preperiod.find_all_by_product_id(@products[l].id).count-1 and l==@products.count-1   #wenn letzter Eintrag
           printf(f, "\n /")                                                                        #beende Parameter
         else                                                                                       #sonst
           printf(f, ", \n")                                                                        #schreibe Komma und Umbruch
         end
        i=i+1
      end
      d=d+Preperiod.find_all_by_product_id(@products[l].id).count                                   #Wenn ein Produkt abgelaufen, zähle Dummy um Anzahl Vorlaufperioden des Produkts weiter
      l=l+1
    end
    printf(f, "\n")

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
    printf(f, "Parameter f(j,k,z) \n /")
      #Eintragsbezeichnung: Jeder Laufindex geht bis Anzahl Einträge-1, da bei 0 der erste Eintrag steht.
    i=0
    while i<@segments.count
      l=0
      while l<@products.count
        y=0
        while y<Preperiod.find_all_by_product_id(@products[l].id).count
         printf(f, "j"+@segments[i].id.to_s+".k"+@products[l].id.to_s+".z"+Preperiod.find_by_preperiodnumber_and_product_id(y, @products[l].id).id.to_s+" "+
          #Finde zugehörigen Wert und gib ihn aus
         Capusage.find_by_segment_id_and_preperiod_id(@segments[i].id, Preperiod.find_by_preperiodnumber_and_product_id(y, @products[l].id).id).capusagevalue.to_s)

         if i==@segments.count-1 and l==@products.count-1 and y==Preperiod.find_all_by_product_id(@products[l].id).count-1 #wenn letzter Eintrag
           printf(f, "\n /")                                                         #beende Parameter
         else                                                                        #sonst
           printf(f, ", \n")                                                         #schreibe Komma und Umbruch
         end
        y=y+1
        end
      l=l+1
      end
    i=i+1
    end
    printf(f, "\n\n")

    #Parameter b(j,t)
    printf(f, "Parameter b(j,t) \n /")
      #Eintragsbezeichnung: Jeder Laufindex geht bis "Anzahl Einträge-1", da bei 0 der erste Eintrag steht.
      i=0
      while i<@segments.count
        s=0
        while s<@timesteps.count
         printf(f, "j"+@segments[i].id.to_s+".t"+@timesteps[s].id.to_s+" "+
          #Finde zugehörigen Wert und gib ihn aus
         Prodcap.find_by_segment_id_and_timestep_id(@segments[i].id, @timesteps[s].id).prodcapvalue.to_s)
         if i==@segments.count-1 and s==@timesteps.count-1                           #wenn letzter Eintrag
           printf(f, "\n /")                                                         #beende Parameter
         else                                                                        #sonst
           printf(f, ", \n")                                                         #schreibe Komma und Umbruch
         end
        s=s+1
        end
      i=i+1
      end
    printf(f, "\n\n")

     #Parameter d(k,t)
    printf(f, "Parameter d(k,t) \n /")

      #Eintragsbezeichnung: Jeder Laufindex geht bis "Anzahl Einträge-1", da bei 0 der erste Eintrag steht.
      l=0
      while l<@products.count
        s=1
        while s<@timesteps.count+1
         printf(f, "k"+@products[l].id.to_s+".t"+Timestep.find_by_stepnumber([s]).id.to_s+" "+
          #Finde erste Produktid, Finde Zeitschritt Nummer 1
         Demand.find_by_product_id_and_timestep_id(@products[l].id, Timestep.find_by_stepnumber([s]).id).demandvalue.to_s)
         #finde zugehörigen Wert und gib ihn aus
         if l==@products.count-1 and s==@timesteps.count                             #wenn letzter Eintrag
           printf(f, "\n /")                                                         #beende Parameter
         else                                                                        #sonst
           printf(f, ", \n")                                                         #schreibe Komma und Umbruch
         end
        s=s+1
        end
      l=l+1
      end
    printf(f, "\n\n")

    #Parameter Umax(j,t)
    printf(f, "Parameter Umax(j,t) \n /")
   # @segments.each{|dummyperiode|                                                    #Dummyperiode für Lageranfangsbestand
   #   printf(f, "j"+dummyperiode.id.to_s+".t0 0, \n")}
      #Eintragsbezeichnung: Jeder Laufindex geht bis "Anzahl Einträge-1", da bei 0 der erste Eintrag steht.
      i=0
      while i<@segments.count
        s=0
        while s<@timesteps.count
         printf(f, "j"+@segments[i].id.to_s+".t"+@timesteps[s].id.to_s+" "+
          #Finde zugehörigen Wert und gib ihn aus
         Maxaddcap.find_by_segment_id_and_timestep_id(@segments[i].id, @timesteps[s].id).maxaddcapvalue.to_s)
         if i==@segments.count-1 and s==@timesteps.count-1                           #wenn letzter Eintrag
           printf(f, "\n /")                                                         #beende Parameter
         else                                                                        #sonst
           printf(f, ", \n")                                                         #schreibe Komma und Umbruch
         end
        s=s+1
        end
      i=i+1
      end
    printf(f, "\n\n")

    f.close

    if File.exist?("HPPLAN_v1_Solution")
      File.delete("HPPLAN_v1_Solution")
    end

    system "c:\\programme\\GAMS23.7\\gams HPPLAN_v1" #Zielpfad muss Rechnergebunden angepasst werden

    render :template => "problems/index"
  end

end
