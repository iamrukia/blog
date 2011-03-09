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

    #attachments
    #Try to use attachments directly and use inline attachments
    attachments.inline["rails.png"] = File.read('public/images/rails.png')

    #mail :to => "to@example.org"
    mail :to => receiver_email, :subject => "Interesting Post", :date => Time.now
  end
end
