require "spec_helper"

describe Foodie do
  describe ".new" do
    it "takes a name and email as arguments" do
      foodie = Foodie.new("Emeril Lagasse", "emeril.lagasse@bam.com")
      expect(foodie).to be_a(Foodie)
    end
  end

  let(:foodie) { Foodie.new("Bobby Flay", "bobby@flay.com") }

  describe "#name" do
    it "has a reader for name" do
      expect(foodie.name).to eq("Bobby Flay")
    end

    it "does not have a writer for name" do
      expect { foodie.name = "Winston Churchill" }.to raise_error(NoMethodError)
    end
  end

  describe "#email" do
    it "has a reader for email" do
      expect(foodie.email).to eq("bobby@flay.com")
    end

    it "does not have a writer for email" do
      expect { foodie.email = "spam@inbox.org" }.to raise_error(NoMethodError)
    end
  end
end
