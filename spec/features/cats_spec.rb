require 'rails_helper'

feature 'cats have toys' do
    scenario 'user can view a cats toys on cat show page' do
      visit '/'
      cat = Cat.create!(
        name: 'Rich'
      )
      toy = Toy.create!(
      name: 'Ball',
      cat_id: cat.id
      )
      click_on 'Cats'
      expect(page).to have_content('Rich')
      click_on 'Rich'
      expect(page).to have_content('Ball')
    end

    scenario 'user can view toy index that lists the cat that owns each of the toys listed' do
      visit '/'
      cat = Cat.create!(
        name: 'Rich'
      )
      toy = Toy.create!(
      name: 'Ball',
      cat_id: cat.id
      )
      click_on 'Toys'
      expect(page).to have_content('Rich')
    end

    scenario 'Toy show page should list the cat that owns that toy (toys are not shared)' do
      visit '/'
      cat = Cat.create!(
        name: 'Rich'
      )
      toy = Toy.create!(
      name: 'Ball',
      cat_id: cat.id
      )
      click_on 'Toys'
      click_on 'Ball'
      expect(page).to have_content('Rich')
    end

    scenario 'Toy new page should have a collection select for all Cats.' do
      visit '/'
      cat1 = Cat.create!(
        name: 'Jack'
      )
      cat2 = Cat.create!(
        name: 'Diane'
      )
      click_on 'Toys'
      click_on 'New Toy!'
      expect(page).to have_content('Jack')
      expect(page).to have_content('Diane')
    end

    scenario 'Toy new page should create a new toy and cat ownership and list it on the index.' do
      visit '/'
      cat1 = Cat.create!(
        name: 'Jack'
      )
      click_on 'Toys'
      click_on 'New Toy!'
      fill_in "Name", with: "Ball"
      select('Jack')
      click_on 'Create Toy'
      expect(page).to have_content('Ball')
    end





end
