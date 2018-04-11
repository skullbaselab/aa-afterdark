module AuthFormHelper
  def sign_in_as_gatordos
    gator = User.create(username: "gatordos", password: "starward")
    visit(new_session_url)
    fill_in("User Name", with: "gatordos")
    fill_in("Password", with: "starward")
    click_on("click me ugh")
  end
end
