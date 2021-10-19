require 'rails_helper'
require 'pp'

RSpec.feature "Visitor goes to the product details page", type: :feature, js: true do


   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 34.99
      )
    end
  end

  scenario "Can see product details" do
    # ACT
    visit root_path
    # visit '/products/1'
    find('.products article:first-child a.btn-default').click
    # puts page.html

    # DEBUG / VERIFY
    # save_screenshot
    expect(page).to have_css 'section.products-show'
  end

 
end
