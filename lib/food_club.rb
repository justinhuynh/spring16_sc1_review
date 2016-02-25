class FoodClub
  attr_reader :name, :start_date, :end_date, :foodies, :theme_dinners

  def initialize(name, start_date, end_date)
    @name = name
    @start_date = start_date
    @end_date = end_date
    @foodies = []
    @theme_dinners = []
  end

  def grand_finale
    @end_date - 1
  end

  def sign_up(foodie)
    @foodies << foodie
  end

  def schedule(theme_dinner)
    @theme_dinners << theme_dinner
  end

  def member_list
    output = %Q(

      Food Club: Frying Foodies
      -----------------------

    )

    @foodies.each do |foodie|
      output += "#{foodie.name} #{foodie.email}"
    end

    output
  end
end
