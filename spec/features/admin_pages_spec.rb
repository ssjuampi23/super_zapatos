require 'spec_helper'

describe "AdminPages" do

  subject { page }

  describe "New" do

    before { visit "/stores/new" }

    it "should create a new store" do
      fill_in "Name",  with: "Store Test"
      fill_in "Address", with: "Curridabat"
      expect { click_button "Create Store"}.to change(Store, :count).by(1)
    end

  end

  describe "Delete" do

    before { visit "/stores" }

    it "should delete a store" do
      #expect { all('a').first.click}.to change(Store, :count).by(-1)
      links = all('a')
      table_links = find(:xpath, "td/a").each { |l| puts l.text }
      
      #puts del_links.count

    end

  end

end
