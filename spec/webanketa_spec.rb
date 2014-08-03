require 'spec_helper'

describe 'webanketa.com' do
  before do
    visit MainPage
  end

  context 'when creating form' do
    it 'should see form title on edit form page' do
      title = 'test_title'
      main_page = MainPage.new(@browser)
      main_page.login_with 'bicaaaaa@gmail.com', '1111111'
      create_form_page = main_page.navigate_to_create_form_page
      edit_form_page = create_form_page.create_form(title, 'Akan', '2')
      edit_form_page.verify_title title
    end
  end

  context 'when navigating to My Forms' do
    it 'should see forms list' do
      main_page = MainPage.new(@browser)
      main_page.login_with 'bicaaaaa@gmail.com', '1111111'
      list_form_page = main_page.navigate_to_my_forms
      list_form_page.verify
    end
  end

  context 'when changing form and adding "one from many"' do
    it 'should see "one from many" and message "Saving was successful!"' do
      main_page = MainPage.new(@browser)
      main_page.login_with 'bicaaaaa@gmail.com', '1111111'
      list_form_page = main_page.navigate_to_my_forms
      edit_form_page = list_form_page.choose_first_form
      edit_form_page.add_one_from_many
      edit_form_page.verify_success_message
    end
  end

  context 'when creating form' do
    it 'should see that form is unpublished for anonymous user' do
      title = 'test_form_not_published'
      main_page = MainPage.new(@browser)
      main_page.login_with 'bicaaaaa@gmail.com', '1111111'
      create_form_page = main_page.navigate_to_create_form_page
      edit_form_page = create_form_page.create_form(title, 'English', '2')
      edit_form_page.check_form_as_anonymous
    end
  end

  context 'when publishing form' do
    it 'should see that on list form page form is published' do
      title = 'test_form_published'
      main_page = MainPage.new(@browser)
      main_page.login_with 'bicaaaaa@gmail.com', '1111111'
      create_form_page = main_page.navigate_to_create_form_page
      edit_form_page = create_form_page.create_form(title, 'English', '0')
      edit_form_page.start_a_publication
      list_form_page = edit_form_page.navigate_to_my_forms
      list_form_page.verify_first_form_is_published
    end
  end
  end