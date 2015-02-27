require 'spec_helper'

 describe "#Stylist" do

  describe ".all" do
    it "starts off with no lists" do
    expect(Stylist.all).to eq ([])
    end
  end

  describe "#name" do
    it "tells you the stylist name" do
     stylist = Stylist.new({:name => "Amber", :id => nil})
     expect(stylist.name).to eq ("Amber")
    end
  end

  describe "#id" do
    it "sets the ID when you save it" do
     stylist = Stylist.new({:name => "Amber", :id => nil})
     stylist.save
     expect(stylist.id).to(be_an_instance_of(Fixnum))
    end
  end

  describe ".find" do
    it "returns a stylist by its ID number" do
     test_stylist = Stylist.new({:name => "Amber", :id => nil})
     test_stylist.save
     test_stylist2 = Stylist.new({:name => "Samantha", :id => nil})
     test_stylist2.save
     expect(Stylist.find(test_stylist2.id)).to eq (test_stylist2)
    end
  end

  describe "#save" do
    it "lets you save stylists to the database" do
     stylist = Stylist.new({:name => "Casey", :id => nil})
     stylist.save
     expect(Stylist.all).to eq ([stylist])
    end
  end

  describe "#==" do
   it "is the same if it has the same description" do
     stylist1 = Stylist.new({:name => "Giovanna", :id => nil})
     stylist2 = Stylist.new({:name => "Giovanna", :id => nil})
     expect(stylist1).to eq (stylist2)
   end
 end

  describe "#update" do
    it "lets you update the list of stylists in the database" do
      stylist = Stylist.new({:name => "Mandy", :id => nil})
      stylist.save
      stylist.update({:name => "Katherine"})
      expect(stylist.name).to eq ("Katherine")
    end
  end

  describe "#delete" do
    it "lets you delete a stylist from the database" do
      stylist = Stylist.new({:name => "Kathy", :id => nil})
      stylist.save
      client = Client.new({:name => "Mary", :stylist_id => stylist.id, :appointment_date => "2015-02-10"})
      client.save
      stylist2 = Stylist.new({:name => "Princess", :id => nil})
      stylist2.save
      stylist.delete
      expect(Stylist.all).to eq ([stylist2])
      expect(Client.all).to eq ([])
    end
  end

  describe "#clients" do
    it "returns an array of clients for the stylist" do
      test_stylist = Stylist.new({:name => "Jasmine", :id => nil})
      test_stylist.save
      test_client = Client.new({:name => "Mary", :stylist_id => test_stylist.id, :appointment_date => "2015-02-10"})
      test_client.save
      test_client2 = Client.new({:name => "John", :stylist_id => test_stylist.id, :appointment_date => "2015-05-10"})
      test_client2.save
      expect(test_stylist.clients).to eq ([test_client, test_client2])
    end
  end
end
