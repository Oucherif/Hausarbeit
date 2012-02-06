# encoding: utf-8
#Magic Comment für deutsche Sonderzeichen
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
    @title = "Über"
  end

  def optimierungsproblem
    @title = "Optimierungproblem"
  end

end
