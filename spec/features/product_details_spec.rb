require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
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

  scenario "They see a single product when they click a relevant link" do
    visit root_path

    click_link(@category.products[0].name)

    puts "the name is: " + @category.products[0].name
    # visit product_path(3)

    # sleep 3
    expect(page).to have_css '.product-detail'

    save_and_open_screenshot

  end

end 