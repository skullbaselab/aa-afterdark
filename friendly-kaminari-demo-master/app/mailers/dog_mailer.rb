class DogMailer < ActionMailer::Base
  default from: "from@example.com"
  def welcome_email(dog)
    mail(to: dog.email, subject: "hi")
  end
end
