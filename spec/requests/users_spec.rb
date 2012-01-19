# Übernommen aus "Ruby on Rails Tutorial" von Michael Hartl
require 'spec_helper'

describe "Users" do
  
  describe "signup" do
    
    describe "failure" do
    
      it "should not make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => ""
          fill_in "E-Mail",        :with => ""
          fill_in "Passwort",     :with => ""                            #Übersetzt
          fill_in "Passwortwiederholung", :with => ""                    #Übersetzt
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end

    describe "success" do

      it "should make a new user" do
        lambda do
          visit signup_path
          fill_in "Name",         :with => "Example User"
          fill_in "E-Mail",        :with => "user@example.com"
          fill_in "Passwort",     :with => "foobar"                     #Übersetzt
          fill_in "Passwortwiederholung", :with => "foobar"             #Übersetzt
          click_button
          response.should have_selector("div.flash.success",
                                        :content => "Willkommen")       #Übersetzt
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end
  end

  describe "sign in/out" do

    describe "failure" do
      it "should not sign a user in" do
        visit signin_path
        fill_in :email,    :with => ""
        fill_in :password, :with => ""
        click_button
        response.should have_selector("div.flash.error", :content => "Invalid")
      end
    end

    describe "success" do
      it "should sign a user in and out" do
        user = Factory(:user)
        visit signin_path
        fill_in :email,    :with => user.email
        fill_in :password, :with => user.password
        click_button
        controller.should be_signed_in
        click_link "Abmelden"                                            #Übersetzt
        controller.should_not be_signed_in
      end
    end
  end
end