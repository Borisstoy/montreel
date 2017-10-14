class AdminNotificationMailer < ApplicationMailer
  default from: "boris.stoy@gmail.com"

  layout 'mailer'

  def new_contact_notification(new_contact)
    @new_contact = new_contact
    mail(to: 'boris.stoy@gmail.com', subject: 'Montreel - Nouvelle demande de contact')
  end
end
