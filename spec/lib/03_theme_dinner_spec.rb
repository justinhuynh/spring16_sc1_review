require "spec_helper"

describe ThemeDinner do
  describe ".new" do
    it "takes a theme name and dinner date as arguments" do
      dinner_date = Date.parse("2015/11/14")
      theme_dinner = ThemeDinner.new("Fried Food", dinner_date)
      expect(theme_dinner).to be_a(ThemeDinner)
    end
  end

  let(:theme_dinner) do
    dinner_date = Date.parse("2015/11/25")
    ThemeDinner.new("Roasted Food", dinner_date)
  end

  describe "#entrees" do
    it "is initialized as an empty array" do
      expect(theme_dinner.entrees).to eq([])
    end
  end

  describe "#add_entree" do
    it "takes in an Entree object and stores it in array" do
      foodie = Foodie.new("James Robert Smith", "jrs@smith.com")
      dish_name = "Roasted Brussels Sprouts"
      entree = Entree.new(dish_name, foodie)

      theme_dinner.add_entree(entree)
      expect(theme_dinner.entrees).to include(entree)
    end
  end
end
