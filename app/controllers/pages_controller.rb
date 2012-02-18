# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
# Struktur Uebernommen aus "Ruby on Rails Tutorial" von Michael Hartl
class PagesController < ApplicationController

  def faq
    @title = "FAQ"
  end

  def startseite
    @title = "Startseite"
  end

  def kontakt
    @title = "Kontakt"
  end

  def about
    @title = "Über"
  end

end
