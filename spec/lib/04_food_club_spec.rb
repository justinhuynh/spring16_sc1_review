require "spec_helper"

describe FoodClub do
  describe ".new" do
    it "takes a group name, start_date, and end_date as arguments" do
      first_day = Date.parse("2015/11/14")
      last_day = Date.parse("2016/2/3")
      food_club = FoodClub.new("Frying Foodies", first_day, last_day)
      expect(food_club).to be_a(FoodClub)
    end
  end

  let(:food_club) do
    FoodClub.new("Frying Foodies", Date.parse("2015/11/14"), Date.parse("2016/2/3"))
  end

  describe "#name" do
    it "has a reader for the club's name" do
      expect(food_club.name).to eq("Frying Foodies")
    end

    it "does not have a writer for name" do
      expect { food_club.name = "Steamed Foodies" }.to raise_error(NoMethodError)
    end
  end

  describe "#start_date" do
    it "has a reader for start_date" do
      expect(food_club.start_date).to eq(Date.parse("2015/11/14"))
    end

    it "does not have a writer for start_date" do
      expect { food_club.start_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#end_date" do
    it "has a reader for end_date" do
      expect(food_club.end_date).to eq(Date.parse("2016/2/3"))
    end

    it "does not have a writer for start_date" do
      expect { food_club.end_date = nil }.to raise_error(NoMethodError)
    end
  end

  describe "#foodies" do
    it "is initialized as an empty array" do
      expect(food_club.foodies).to eq([])
    end
  end

  describe "#theme_dinners" do
    it "is initialized as an empty array" do
      expect(food_club.theme_dinners).to eq([])
    end
  end

  describe "#grand_finale" do
    it "should be one day before the end_date" do
      grand_finale = Date.parse("2016/2/2")
      expect(food_club.grand_finale).to eq(grand_finale)
    end

    it "should be different for a different food club" do
      start_date = Date.parse("2015/12/24")
      end_date = Date.parse("2016/3/12")
      soup_drinkers = FoodClub.new("Soup Drinkers", start_date, end_date)

      expect(soup_drinkers.grand_finale).to eq(Date.parse("2016/03/11"))
    end

    it "should be a date object" do
      expect(food_club.grand_finale).to be_a(Date)
    end
  end

  describe "#sign_up" do
    it "adds a foodie to the foodies array" do
      foodie = Foodie.new("Emeril Lagasse", "emeril.lagasse@bam.com")
      food_club.sign_up(foodie)
      expect(food_club.foodies).to include(foodie)
    end
  end

  describe "#schedule" do
    it "adds a theme_dinner to the theme_dinners array" do
      dinner_date = Date.parse("2015/11/14")
      theme_dinner = ThemeDinner.new("Fried Food", dinner_date)

      food_club.schedule(theme_dinner)
      expect(food_club.theme_dinners).to include(theme_dinner)
    end
  end

  let(:food_club_with_foodies) do
    foodie_1 = Foodie.new("Emeril Lagasse", "emeril.lagasse@bam.com")
    foodie_2 = Foodie.new("Jane Eater", "jane@eater.com")
    foodie_3 = Foodie.new("James Robert Smith", "jrs@smith.com")

    food_club.sign_up(foodie_1)
    food_club.sign_up(foodie_2)
    food_club.sign_up(foodie_3)

    food_club
  end

  describe "#member_list" do
    <<-EXAMPLE_OUTPUT

      Food Club: Frying Foodies
      -----------------
      Emeril Lagasse emeril.lagasse@bam.com
      Jane Eater jane@eater.com
      James Robert Smith jrs@smith.com

    EXAMPLE_OUTPUT

    it "returns a string" do
      expect(food_club_with_foodies.member_list).to be_a(String)
    end

    it "includes the food club name" do
      expect(food_club_with_foodies.member_list).to include("Frying Foodies")
    end

    it "includes the foodies' names" do
      expect(food_club_with_foodies.member_list).to include("Emeril")
      expect(food_club_with_foodies.member_list).to include("Jane")
      expect(food_club_with_foodies.member_list).to include("James")
    end

    it "includes the foodies' email addresses" do
      expect(food_club_with_foodies.member_list).to include("emeril.lagasse@bam.com")
      expect(food_club_with_foodies.member_list).to include("jane@eater.com")
      expect(food_club_with_foodies.member_list).to include("jrs@smith.com")
    end
  end
end
