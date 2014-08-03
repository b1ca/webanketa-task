class ListFormPage
  include PageObject

  page_url 'http://webanketa.com/en/myforms/'

  h1(:title_h1, :css => 'h1')
  div(:remove_form_btn, :css => "div[onclick*='remove']")
  div(:create_form_btn, :css => "div[onclick*='create']")
  link(:first_form, :css => "a[href*='form.uid']")


  def verify()
    self.title_h1 == 'My Forms'
    self.remove_form_btn == 'remove'
    self.create_form_btn == 'Create new'
  end

  def choose_first_form()
    first_form
    EditFormPage.new(@browser)
  end

  def verify_first_form_is_published()
    @browser.find_element(:css, 'img[title]').attribute('title') == 'Published'
  end
end