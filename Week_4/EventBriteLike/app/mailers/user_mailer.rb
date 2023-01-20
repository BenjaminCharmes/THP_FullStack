class UserMailer < ApplicationMailer

  default from: 'pifrupouteku-8331@yopmail.com'

  def welcome_email(user)
    @user = user 

    @url  = 'https://the-event-project.fly.dev/users/sign_in' 

    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attendance_email(attendance)
    @event = attendance.event

    @participant = attendance.user

    mail(to: @event.admin.email, subject: "Nouvelle participation à l'événement #{@event.title} 🎉")
  end

end