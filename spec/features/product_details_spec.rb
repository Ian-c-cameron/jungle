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

    # find('article.product', match: :first).hover
    # page.find_link("Login", match: :first).click
    page.find('article.product', match: :first).find_link("Details", match: :first).click
    
    # DEBUG / VERIFY

    
    

    expect(page).to have_css 'article.product-detail'
    save_screenshot
  end

end
