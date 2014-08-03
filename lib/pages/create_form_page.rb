class CreateFormPage
  include PageObject

  text_field(:title, :class => 'title')
  select(:language, :name => 'form.lid')
  radio_button_group(:uniqueness, :name => 'form.respuniqtype')
  button(:save_form, :class => 'medium')

  def create_form(title, language, uniqueness)
    self.title = title
    self.language = language
    self.select_uniqueness uniqueness
    save_form
    EditFormPage.new(@browser)
  end
end