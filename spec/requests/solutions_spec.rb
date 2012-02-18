# encoding: utf-8
# Magic Comment für deutsche Sonderzeichen
require 'spec_helper'

describe "Solutions" do

  before(:each) do
      visit solutions_path
    end

  describe "should have the right links" do

    describe "when there is a solution" do

      if File.exists?("HPPLAN_v1_OFV.txt") do

        it "should have a Produktion und Lagerung link" do
          response.should have_selector("a", :href => view_solprodstors_path,
                                             :content => "Produktion und Lagerung")
        end

        it "should have a Genutzte Zusatzkapazitäten link" do
          response.should have_selector("a", :href => view_solsegs_path,
                                             :content => "Genutzte Zusatzkapazitäten")
        end
      end
      end
    end
  end
end