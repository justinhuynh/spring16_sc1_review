require "spec_helper"

describe Entree do
  describe ".new" do
    it "takes a dish and foodie as arguments" do
      dish_name = "Fried Chicken"
      foodie = Foodie.new("Joe Eater", "joe@eater.com")
      entree = Entree.new(dish_name, foodie)
      expect(entree).to be_a(Entree)
    end
  end

  let(:entree) do
    foodie = Foodie.new("Jane Eater", "jane@eater.com")
    Entree.new("Fried Oreos", foodie)
  end

  describe "#dish_name" do
    it "is a string" do
      expect(entree.dish_name).to be_a(String)
    end

    it "has a reader for dish name" do
      expect(entree.dish_name).to eq("Fried Oreos")
    end

    it "does not hard-code the entree" do
      other_foodie = Foodie.new("Joseph T. Frog", "joe.frog@gmail.com")
      other_entree = Entree.new("Fried Twinkies", other_foodie)
      expect(other_foodie.entree).to eq("Fried Twinkies")
    end

    it "does not have a writer for dish_name" do
      expect { entree.dish_name = "nil" }.to raise_error(NoMethodError)
    end
  end

  describe "#foodie" do
    it "has a reader for foodie" do
      expect(entree.foodie).to be_a(Foodie)
    end

    it "does not have a writer for foodie" do
      expect { entree.foodie = nil }.to raise_error(NoMethodError)
    end
  end
end
