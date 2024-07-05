# frozen_string_literal: true

require 'application_system_test_case'

class KanbansTest < ApplicationSystemTestCase
  setup do
    @kanban = kanbans(:one)
  end

  test 'visiting the index' do
    visit kanbans_url
    assert_selector 'h1', text: 'Kanbans'
  end

  test 'should create kanban' do
    visit kanbans_url
    click_on 'New kanban'

    fill_in 'Cards', with: @kanban.cards
    fill_in 'Description', with: @kanban.description
    fill_in 'Name', with: @kanban.name
    click_on 'Create Kanban'

    assert_text 'Kanban was successfully created'
    click_on 'Back'
  end

  test 'should update Kanban' do
    visit kanban_url(@kanban)
    click_on 'Edit this kanban', match: :first

    fill_in 'Cards', with: @kanban.cards
    fill_in 'Description', with: @kanban.description
    fill_in 'Name', with: @kanban.name
    click_on 'Update Kanban'

    assert_text 'Kanban was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Kanban' do
    visit kanban_url(@kanban)
    click_on 'Destroy this kanban', match: :first

    assert_text 'Kanban was successfully destroyed'
  end
end
