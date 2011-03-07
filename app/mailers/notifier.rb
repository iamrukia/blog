class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(post, sender_name, receiver_email)
    #@greeting = "Hi"
    @post = post
    @sender_name = sender_name

    #mail :to => "to@example.org"
    mail :to => receiver_email, :subject => "Interesting Post"
  end
end
