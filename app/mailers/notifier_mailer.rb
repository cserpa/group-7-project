class NotifierMailer < ApplicationMailer
  default from: '<figurate@yahoo.com>',
          return_path: '<figurate@yahoo.com>'

  def notify(user)
    @user = user
    mail(to: "<#{@user.email}>",
         subject: 'Your figure has been rated!')
  end
end
