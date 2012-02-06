# encoding: utf-8
#Magic Comment für deutsche Sonderzeichen
# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
require 'spec_helper'

describe "LayoutLinks" do

  describe "when not signed in" do

    before(:each) do
      visit signout_path
    end

    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Startseite")              #Linkbeschreibung übersetzt
    end

    it "should have a Kontakt page at '/kontakt'" do
      get '/kontakt'
      response.should have_selector('title', :content => "Kontakt")                 #Linkbeschreibung übersetzt
    end

    it "should have an About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "Über")
    end

    it "should have a FAQ page at '/faq'" do
      get '/faq'
      response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
    end

    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Registrierung")
    end

    it "should have a signin page at '/signin'" do
      get '/signin'
      response.should have_selector('title', :content => "Anmelden")
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "Über"
      response.should have_selector('title', :content => "Über")
      click_link "FAQ"                                                              #Linkbeschreibung verändert
      response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
      click_link "Kontakt"                                                          #Linkbeschreibung übersetzt
      response.should have_selector('title', :content => "Kontakt")                 #Linkbeschreibung übersetzt
      click_link "Startseite"
      response.should have_selector('title', :content => "Startseite")
      click_link "Anmelden"
      response.should have_selector('title', :content => "Anmelden")
    end

    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Anmelden")                  #Übersetzt
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a Home page at '/'" do
      get '/'
      response.should have_selector('title', :content => "Startseite")              #Linkbeschreibung übersetzt
    end

    it "should have a Kontakt page at '/kontakt'" do
      get '/kontakt'
      response.should have_selector('title', :content => "Kontakt")                 #Linkbeschreibung übersetzt
    end

    it "should have an About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "Über")
    end

    it "should have a FAQ page at '/faq'" do
      get '/faq'
      response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
    end

    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Registrierung")
    end

    it "should have a signin page at '/signin'" do
      get '/signin'
      response.should have_selector('title', :content => "Anmelden")
    end

    it "should have the right links on the layout" do
      visit root_path
      click_link "Über"
      response.should have_selector('title', :content => "Über")
      click_link "FAQ"                                                              #Linkbeschreibung verändert
      response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
      click_link "Kontakt"                                                          #Linkbeschreibung übersetzt
      response.should have_selector('title', :content => "Kontakt")                 #Linkbeschreibung übersetzt
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Abmelden")                  #Übersetzt
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profil")                   #Übersetzt
    end

    it "should have a optimierungsproblem link" do
      visit root_path
      response.should have_selector("a", :href => problems_path,
                                         :content => "Optimierungsproblem")
    end

    describe "on page optimierungsproblem" do

      it "should have a new problem link" do
      visit problems_path
      response.should have_selector("a", :href => new_problem_path,
                                         :content => "Neues Optimierungsproblem anlegen")
      end

      it "should have some load problem links" do
      pending

      end
    end
  end
end