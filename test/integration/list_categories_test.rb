require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest
def setup 
  @category = Category.new(name: "Sports")
  @category2 = Category.new(name: "Travel")
end
end
