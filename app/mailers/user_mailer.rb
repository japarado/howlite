class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.application_notification.subject
  #
  #def application_notification(user, job)
  #
def application_notification(faculty,job,third)
    @faculty = faculty
    @job = job
    @third = third

    mail to: @job.email, subject: "Application Notification", from: "admin@instruu.org"
  end
end
