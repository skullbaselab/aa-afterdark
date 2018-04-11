class Notification < ApplicationMailer
  default from: "admin@blogger.com"

  def article_created(user, article)
    @user = user
    @article = article
    attachments['test_image.png'] = File.read('app/assets/images/test_image.png')
    mail(to: @user.email, subject: "Article Created!")
  end
end
