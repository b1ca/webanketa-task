class MainPage
  include PageObject

  page_url 'http://webanketa.com/en'

  button(:create_form, :css => 'div.button.big')
  link(:show_auth_form, :css => 'a.js.hover')
  text_field(:username, :id => 'user.auth.login')
  text_field(:password, :id => 'user.auth.pass')
  button(:login, :css => 'button.small')
  link(:logout, :css => 'a[href*=logout]')
  link(:my_forms, :href => '/en/myforms/')

  def login_with(username, password)
    show_auth_form
    self.username = username
    self.password = password
    login
    self.wait_until do
      self.text.include? 'Exit'
    end
  end

  def navigate_to_create_form_page()
    create_form
    CreateFormPage.new(@browser)
  end

  def navigate_to_my_forms()
    my_forms
    ListFormPage.new(@browser)
  end
end