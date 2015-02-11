require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
 test "product attributes must not be empty" do
   product = Product.new(title: "My Book Title", description: "xyz", image_url: "xyz.jpg")
   product.price = -1
   assert product.invalid?
   assert_equal ["must be greater than or equal to 0.01"]
   product.errors[:price]
   
   product.price = 0
   assert product.invalid?
   assert_equal ["must be greater than or equal to 0.01"]
   product.errors[:price]
   
   product.price = 1
   assert product.valid?
end   
   
  def new_product(image_url)
     Product.new(title: "My Book Title", description: "xyz", price: 1, image_url: image_url)
  end
  
  test "image url"  do
    ok = %w{ fred.gif fed.jpg fred.png FED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    okay.each do |name|
      assert new_product(name).valid?, "#{name} should be valid"
  end
  bad.each do |name|
    assert new_product(name).invalid?, "#{name} shouldn't be valid"
  end
end    
    
    
   
   assert product.errors[:title].any?
   assert product.errors[:description].any?
   assert product.errors[:price].any?
   assert product.errors[:image_url].any?
end   