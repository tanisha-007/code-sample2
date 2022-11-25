module MealDb
  class Recipe < Base

    attr_accessor :str_meal, :str_meal_thumb, :id_meal

    def initialize(args = {})
      super(args)
    end

    def self.filter(category)
      response = Request.fetch("/api/json/v1/1/filter.php?c=#{category}")
      response['meals']&.map { |meal| Recipe.new(meal) }
    end
  end
end
