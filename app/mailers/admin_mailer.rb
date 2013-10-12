class AdminMailer < ActionMailer::Base
  default from: "contact.sg@ncssm.edu"

  def contact_us_email(email_subject, email_body)
    @email_subject = email_subject
    @email_body = email_body
    Admin.all.each do |admin|
      mail(to: admin.email, subject: @email_subject)
    end
  end
end
