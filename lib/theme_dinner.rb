class ThemeDinner
  attr_reader :theme_name, :dinner_date, :entrees

  def initialize(theme_name, dinner_date)
    @theme_name = theme_name
    @dinner_date = dinner_date
    @entrees = []
  end

  def add_entree(entree)
    @entrees << entree
  end
end
