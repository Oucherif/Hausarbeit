# Struktur Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
   @base_title="HPPLAN Online!"                                                   # Basistitel angepasst
  end

   describe "GET 'faq'" do
    it "should be successful" do
      get 'faq'
      response.should be_success
    end
    it "should have the right title" do
      get'faq'
      response.should have_selector("title", :content => @base_title + " FAQ")           #Linkbeschreibung verändert
    end
  end


  describe "GET 'startseite'" do
    it "should be successful" do
      get 'startseite'
      response.should be_success
    end
    it "should have the right title" do
      get'startseite'
      response.should have_selector("title", :content => @base_title + " Startseite")       #Test an Übersetzung angepasst
    end
  end

 describe "GET 'kontakt'" do
    it "should be successful" do
      get 'kontakt'
      response.should be_success
    end

    it "should have the right title" do
      get 'kontakt'
      response.should have_selector("title", :content => @base_title + " Kontakt")         #Test an Übersetzung angepasst
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title", :content => @base_title + " About")
    end
  end

end
