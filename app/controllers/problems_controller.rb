class ProblemsController < ApplicationController



  def new
     @problem=Problem.new

  end

  def create
     @problem=Problem.new(params[:problem])

     respond_to do |format|
       if @problem.save
         format.html {redirect_to '/problems', notice: 'Problem wurde erfolgreich erstellt.'}
         format.json {render json: @problem, status: :created, location: @problem}
       else
         format.html {render action: "new"}
         format.json {render json: @problem.errors, status: :unprocessable_entity}
       end
     end
  end

  def show
    @problems=Problem.all
  end

  def index
    if $current_user==nil  #Bei direktem Aufruf von /problems zunächst auf Startseite verweisen, da sonst "called id on nil"-Fehler auftreten kann
    redirect_to root_path
    else
    @problem=Problem.find_all_by_user_id($current_user.id)
    end
  end

  def optimize
    if File.exist?("HPPLAN_v1_Input_Instanz1.inc")
       File.delete("HPPLAN_v1_Input_Instanz1.inc")
    end
    f=File.new("HPPLAN_v1_Input_Instanz1.inc", "w")

    #Sets
    i=1
    printf(f, "set j / \n")
    @segments=Segment.all
    @segments.each { |segments|
      printf(f, "j" + i.to_s + "\n")
      i=i+1}
    printf(f, "/ \n\n")

    i=1
    printf(f, "k / \n")
    @products=Product.all
    @products.each { |products|
      printf(f, "k" + i.to_s + "\n")
      i=i+1}
    printf(f, "/ \n\n")

    printf(f, "t / \n")
    @timesteps=Timestep.all.sort!{|a,b| a.stepnumber <=> b.stepnumber}
    i=1
    @timesteps.each {|timesteps|
    printf(f, "t"+i.to_s+"\n")
    i=i+1}
    printf(f, "/ \n\n")

    i=1
    printf(f, "z / \n")
    @preperiods=Preperiod.all
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
    @storagecosts=Storagecost.all
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
    @storagestarts=Storagestart.all
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
    @addcapcosts=Addcapcost.all
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
      t=t+1}
    j=j+1}
    printf(f, "/ ")
    #Parameter beendet
    printf(f, ";\n\n")

    f.close

    if File.exist?("HPPLAN_v1_Solution")
      File.delete("HPPLAN_v1_Solution")
    end

    system "c:\\programme\\GAMS23.7\\gams HPPLAN_v1" #Zielpfad muss Rechnergebunden angepasst werden

    render :template => "problems/index"
  end

end
