require 'rails_helper'

RSpec.feature "Visitor can click add to cart on a product", type: :feature, js: true do


  # SETUP
  before :each do
   @category = Category.create! name: 'Apparel'

   1.times do |n|
     @category.products.create!(
       name:  Faker::Hipster.sentence(3),
       description: Faker::Hipster.paragraph(4),
       image: open_asset('apparel1.jpg'),
       quantity: 10,
       price: 34.99
     )
   end
 end

 scenario "Cart count increase to 1" do
   # ACT
   visit root_path
   find('.products article:first-child button.btn-primary').click
  #  puts page.html

   # DEBUG / VERIFY
   save_screenshot
   expect(page).to have_content '1'
 end


end
