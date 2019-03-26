require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
          )
    end
  end


  scenario "Seeing cart increment everytime an item is added to cart" do

    visit root_path

    first('article.product').find_button('Add').click

    expect(page).to have_content "My Cart (1)"

    page.all('article.product')[1].find_button('Add').click

    expect(page).to have_content "My Cart (2)"

    save_screenshot
  end


end
