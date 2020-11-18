require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  
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

  scenario "They see one product" do
    # ACT
    visit root_path
    expect(page).to have_link 'My Cart (0)'


    page.find('article.product', match: :first).find_button("Add").click
    
    # DEBUG / VERIFY
    expect(page).to have_link 'My Cart (1)'
    save_screenshot
  end

end