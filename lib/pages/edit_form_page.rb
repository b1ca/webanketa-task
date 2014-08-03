class EditFormPage
  include PageObject

  span(:span_title, :css => '#el-1 span.jsTitle_title')
  link(:edit_form_tab, :xpath => "//a[.='Editing']")
  link(:add_element_btn, :css => '#lastElHolder a')
  link(:radiobuttons, :css => "a.radiobuttons[onclick*='InsertComponent']")
  button(:save_form, :id => 'submit_constructor_button_prop')
  div(:success_msg, :id => 'msgSuccessSave')
  link(:links_form_tab, :xpath => "//a[.='Links']")
  link(:logout, :css => 'a[href*=logout]')
  text_field(:form_url, :css => ".relSubtab_ .form_link[value^='http']")
  link(:publication_form_tab, :xpath => "//a[.='Publication']")
  button(:form_public_btn, :css => "*[name=form_public][value='1']")
  link(:my_forms, :href => '/en/myforms/')

  def verify_title(title)
    self.span_title == title
  end

  def add_one_from_many()
    edit_form_tab
    add_element_btn
    radiobuttons
    save_form
  end

  def verify_success_message()
    self.success_msg == 'Saving was successful!'
  end

  def check_form_as_anonymous()
    links_form_tab
    url = self.form_url
    logout
    @browser.get url
    @browser.find_element(:css, '.message.form_unavailable').text == 'Unfortunately, this form is inaccessible!'
  end

  def navigate_to_my_forms()
    my_forms
    ListFormPage.new(@browser)
  end

  def start_a_publication()
    publication_form_tab
    form_public_btn
  end
end