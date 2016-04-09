class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }

  def register
    g = Gibbon::Request.new
    begin
      g.lists(list_id)
        .members
        .create(body: {email_address: email, status: "subscribed"})
    rescue Gibbon::MailChimpError => e
      # TODO: Report proper errors?
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
  end

  private

  def list_id
    Rails.application.secrets.list_id
  end

end
