require 'spec_helper'


 describe Client do

  describe ".all"  do
    it "is empty at first" do
      expect(Client.all).to eq ([])
    end
  end

  describe "#name" do
    it "provides name of a client" do
      test_client = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-30"})
      expect(test_client.name).to eq ("Mary")
    end
  end

  describe "#==" do
    it "is the same client if it has the same name, stylist id, and appointment date" do
      client1 = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-30"})
      client2 = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-30"})
      expect(client1).to eq (client2)
    end
  end

  describe "#save" do
    it "adds a client to the array of saved clients" do
      test_client = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-25"})
      test_client.save
      expect(Client.all).to eq ([test_client])
    end
  end

  describe "stylist_id" do
    it "gives the stylist id that a client is associated with" do
      test_client = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-25"})
      test_client.save
      expect(test_client.stylist_id).to eq (1)
    end
  end

  describe "appointment_date" do
    it "gives the date that a client will come into the salon" do
      test_client = Client.new({:name => "Mary", :stylist_id => 1, :appointment_date => "2015-01-25"})
      test_client.save
      expect(test_client.appointment_date).to eq ("2015-01-25")
    end
  end
end
