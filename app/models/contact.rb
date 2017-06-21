class Contact < MailForm::Base

  validates :message, length: { maximum: 2000 }

  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message 
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "Message to cur1osity.com",
      :to => "cur1osity.noreply@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end