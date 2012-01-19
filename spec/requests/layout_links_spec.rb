# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
require 'spec_helper'

describe "LayoutLinks" do

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
    response.should have_selector('title', :content => "About")
  end

  it "should have a FAQ page at '/faq'" do
    get '/faq'
    response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
  end

  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Registrierung")
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
    click_link "FAQ"                                                              #Linkbeschreibung verändert
    response.should have_selector('title', :content => "FAQ")                     #Linkbeschreibung verändert
    click_link "Kontakt"                                                          #Linkbeschreibung übersetzt
    response.should have_selector('title', :content => "Kontakt")                 #Linkbeschreibung übersetzt
    click_link "Startseite"                                                       #Linkbeschreibung übersetzt
    response.should have_selector('title', :content => "Startseite")              #Linkbeschreibung übersetzt
    click_link "Jetzt registrieren!"                                              #Linkbeschreibung übersetzt
    response.should have_selector('title', :content => "Registrierung")
  end

  describe "when not signed in" do
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

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Abmelden")                 #Übersetzt
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profil")                   #Übersetzt
    end
  end
end