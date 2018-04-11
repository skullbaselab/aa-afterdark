module ApplicationHelper
  # Make your life easier,
  # define the CSRF auth token in a helper
  # and put it in all the forms!
  def auth_token_input
    string = <<-HTML
    <input
        type="hidden"
        name="authenticity_token"
        value="#{ form_authenticity_token }">
    HTML
    string.html_safe
  end
end
