class CategoriesRepresenter
    def initialize(categories)
      @categories = categories
    end
  
    def as_json
      categories.map do |category|
        {
          id: category.id,
          name: category.name,
          icon: category.iconUrl
        }
      end
    end
  
    private
  
    attr_reader :categories
  end