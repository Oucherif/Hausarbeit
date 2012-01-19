# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
module ApplicationHelper

  # Return a title on a per-page basis.
  def title
    base_title = "HPPLAN Online!"                                           # Basistitel angepasst
    if @title.nil?
       base_title
    else
      "#{base_title}"+" "+"#{@title}"
    end
  end

  def logo
    image_tag("logo.png", :alt => "HPPLAN Online!", :class => "round")      # Alternative Grafikbeschreibung angepasst
  end

  def no_spam
    image_tag("no_spam.gif", :alt => "at", :class => "round")
    # @ als Grafik definiert für Spamschutz, Grafik übernommen vom Produktionsinstitut
    # http://www.prod.uni-hannover.de/team.html
  end

end
