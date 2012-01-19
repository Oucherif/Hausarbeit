# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class PagesController < ApplicationController

  def faq
    @title = "FAQ"
  end

  def startseite
    @title = "Startseite"                                                   #Titel der Startseite übersetzt
  end

  def kontakt
    @title = "Kontakt"                                                      #Titel der Kontaktseite übersetzt
  end

  def about
    @title = "About"
  end

end
