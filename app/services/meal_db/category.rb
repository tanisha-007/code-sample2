module MealDb
  class Category < Base

    attr_accessor :id_category, :str_category, :str_category_thumb, :str_category_description

    def initialize(args = {})
      super(args)
    end

    def self.all
      response = Request.fetch("/api/json/v1/1/categories.php")
      response['categories']&.map { |category| Category.new(category) }
    end
  end
end
