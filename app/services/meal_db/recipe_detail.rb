module MealDb
  class RecipeDetail < Base

    INGREDIENT_AND_MEASURE_ATTR_COUNT = 20

    attr_accessor :id_meal, :str_meal, :str_drink_alternate, :str_category, :str_area, :str_instructions, :str_meal_thumb, :str_tags, :str_youtube, :str_source, :str_image_source, :str_creative_commons_confirmed, :date_modified

    def initialize(args = {})
      load_dynamic_accessors
      super(args)
    end

    def load_dynamic_accessors
      arr = (1..INGREDIENT_AND_MEASURE_ATTR_COUNT).to_a
      arr.each { |num| self.class.send(:attr_accessor, "str_ingredient#{num}")}

      arr.each { |num| self.class.send(:attr_accessor, "str_measure#{num}")}
    end

    def self.lookup(recipe_id)
      response = Request.fetch("/api/json/v1/1/lookup.php?i=#{recipe_id}")
      response['meals']&.map { |meal| RecipeDetail.new(meal) }
    end
  end
end
